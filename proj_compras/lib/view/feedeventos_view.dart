import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/feedeventos_controller.dart';
import '../model/postevento_model.dart';
import '../model/user_model.dart';
import 'addevento_view.dart';

class FeedEventosView extends StatefulWidget {
  const FeedEventosView({super.key});

  @override
  State<FeedEventosView> createState() => _FeedEventosViewState();
}

class _FeedEventosViewState extends State<FeedEventosView> {
  final FeedEventos _controller = FeedEventos();
  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  final _usuarioAtual = UserModel(
    id: 1,
    email: "usuario@email.com", 
    name: "Nome do Usuário",
    password: "123",
  );

  void _mostrarTelaCriarEvento() {
    showDialog(
      context: context,
      builder: (context) => AddEventoView(
        onEventoCriado: (novoEvento) {
          _controller.addEvento(novoEvento);
          // atualiza a tela
          setState(() {});
        },
        usuarioAtual: _usuarioAtual,
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Feed de Eventos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF45b5b7)),
            onPressed: _mostrarTelaCriarEvento, // chamando a criação
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _controller.eventos.length,
        itemBuilder: (context, index) {
          final evento = _controller.eventos[index];
          return _buildEventCard(evento);
        },
      ),
    );
  }

  Widget _buildEventCard(Evento evento) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho do card com info do usuário
          ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF45b5b7),
              child: Text(
                evento.user.name[0].toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              evento.user.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'Publicado em ${dateFormat.format(evento.date)}',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // TODO: Implementar menu de opções
              },
            ),
          ),

          // Título do evento
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              evento.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Descrição do evento
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              evento.description,
              style: const TextStyle(color: Colors.white),
            ),
          ),

          // Local do evento
          if (evento.location.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Color(0xFF45b5b7), size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      evento.location,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

          // Data do evento
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, color: Color(0xFF45b5b7), size: 20),
                const SizedBox(width: 8),
                Text(
                  dateFormat.format(evento.date),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),

          // Barra de ações
          const Divider(color: Colors.grey),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, 'Curtir'),
                _buildActionButton(Icons.comment_outlined, 'Comentar'),
                _buildActionButton(Icons.share_outlined, 'Compartilhar'),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {
        // TODO: Implementar ações dos botões
      },
      icon: Icon(icon, color: Colors.grey),
      label: Text(
        label,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}