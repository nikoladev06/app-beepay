import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/professionalfeed_controller.dart';
import '../model/professionalpost_model.dart';
import  'addprofessionalpost_view.dart';

class ProfessionalFeedView extends StatefulWidget {
  const ProfessionalFeedView({super.key});

  @override
  State<ProfessionalFeedView> createState() => _ProfessionalFeedViewState();
}

class _ProfessionalFeedViewState extends State<ProfessionalFeedView> {
  final ProfessionalFeed _controller = ProfessionalFeed();
  final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

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
        title: const Text(
          'Vagas e Oportunidades',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF45b5b7)),
            onPressed: _createProfessionalPost,
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _controller.professionalPosts.length,
            itemBuilder: (context, index) => _cardProfessionalPost(_controller.professionalPosts[index]),
          );
        },
      ),
    );
  }

  Widget _cardProfessionalPost(ProfessionalPost professionalPost) {
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
                    professionalPost.user.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        professionalPost.user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        dateFormat.format(professionalPost.createdAt),
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
                    _controller.mostrarOpcoesProfessionalPost(context, professionalPost);
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(maxWidth: 40),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Text(
              professionalPost.description,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
            if (professionalPost.imageUrl != null) ...[
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  professionalPost.imageUrl!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],

            if (professionalPost.likesCount > 0 || professionalPost.comentarios.isNotEmpty) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  if (professionalPost.likesCount > 0) 
                    Text(
                      '${professionalPost.likesCount} curtidas',
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                  if (professionalPost.likesCount > 0 && professionalPost.comentarios.isNotEmpty) 
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text('•', style: TextStyle(color: Colors.grey[400])),
                    ),
                  if (professionalPost.comentarios.isNotEmpty)
                    Text(
                      '${professionalPost.comentarios.length} comentários',
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
                    _controller.toggleLike(professionalPost.id);
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
                        professionalPost.isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: professionalPost.isLiked ? const Color(0xFF45b5b7) : Colors.grey,
                        size: 18,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Curtir',
                        style: TextStyle(
                          color: professionalPost.isLiked ? const Color(0xFF45b5b7) : Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _controller.mostrarDialogComentario(context, professionalPost);
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
                    _controller.compartilharProfessionalPost(context, professionalPost);
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

  void _createProfessionalPost() {
    showDialog(
      context: context,
      builder: (context) => AddProfessionalPostView(
        onProfessionalPostCriado: (novoPost) {
          _controller.adicionarProfessionalPost(novoPost);
          setState(() {});
        },
        usuarioAtual: _controller.usuarioAtual,
      ),
    );
  }
}