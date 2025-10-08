import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/feedeventos_controller.dart';
import '../model/postevento_model.dart';
import 'addevento_view.dart';

class FeedEventosView extends StatefulWidget {
  const FeedEventosView({super.key});

  @override
  State<FeedEventosView> createState() => _FeedEventosViewState();
}

class _FeedEventosViewState extends State<FeedEventosView> {
  final FeedEventos _controller = FeedEventos();
  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  void _criarEvento() {
    showDialog(
      context: context,
      builder: (context) => AddEventoView(
        onEventoCriado: (novoEvento) {
          _controller.addEvento(novoEvento);
          setState(() {});
        },
        usuarioAtual: _controller.usuarioAtual,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111112),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 99, 99, 102),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'inicio');
          },
        ),
        title: const Text('Feed de Eventos', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF45b5b7)),
            onPressed: _criarEvento,
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _controller.eventos.length,
            itemBuilder: (context, index) => _cardEvento(_controller.eventos[index]),
          );
        },
      ),
    );
  }

  Widget _cardEvento(Evento evento) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.grey[900],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF45b5b7),
                  radius: 20,
                  child: Text(
                    evento.user.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        evento.user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dateFormat.format(evento.createdAt),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, color: Colors.white, size: 20),
                  onPressed: () {
                    _controller.mostrarOpcoesEvento(context, evento);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxWidth: 40),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              evento.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              evento.description,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),

            if (evento.imageUrl != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  evento.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],

            if (evento.location.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF45b5b7), size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      evento.location,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Color(0xFF45b5b7), size: 16),
                const SizedBox(width: 6),
                Text(
                  dateFormat.format(evento.date),
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),

            if (evento.likesCount > 0 || evento.comentarios.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  if (evento.likesCount > 0) 
                    Text(
                      '${evento.likesCount} curtidas',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  if (evento.likesCount > 0 && evento.comentarios.isNotEmpty) 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text('•', style: TextStyle(color: Colors.grey[400])),
                    ),
                  if (evento.comentarios.isNotEmpty)
                    Text(
                      '${evento.comentarios.length} comentários',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                ],
              ),
            ],

            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    _controller.toggleLike(evento.id);
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        evento.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: evento.isLiked ? const Color(0xFF45b5b7) : Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Curtir',
                        style: TextStyle(
                          color: evento.isLiked ? const Color(0xFF45b5b7) : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.mostrarDialogComentario(context, evento);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.comment_outlined, color: Colors.grey, size: 18),
                      SizedBox(height: 2),
                      Text(
                        'Comentar',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.compartilharEvento(context, evento);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size.zero,
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.share_outlined, color: Colors.grey, size: 18),
                      SizedBox(height: 2),
                      Text(
                        'Compartilhar',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}