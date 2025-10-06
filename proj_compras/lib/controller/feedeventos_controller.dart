import 'package:flutter/material.dart';
import '../model/postevento_model.dart';
import '../model/user_model.dart';

class FeedEventos extends ChangeNotifier {
  final List<Evento> _eventos = [
    Evento(
      id: 1,
      title: "Integra Fatec RP",
      description: "Halloween da Fatec RP: open bar e muita música",
      date: DateTime(2025, 10, 28),
      location: "",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
      likesCount: 15,
    ),
    Evento(
      id: 2,
      title: "Semana Acadêmica Fatec RP",
      description: "Palestras, workshops e networking com profissionais da área de tecnologia.",
      date: DateTime(2025, 11, 10),
      location: "Auditório Principal - Fatec RP",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
      likesCount: 8,
    ),
    Evento(
      id: 3,
      title: "InterFatecs 2025",
      description: "Competições esportivas e culturais entre as Fatecs do estado de São Paulo.",
      date: DateTime(2025, 12, 5),
      location: "Ginásio Municipal de Ribeirão Preto",
      imageUrl: "https://",
      user: UserModel(id: 1, email: "admin@admin.com", name: "Admin", password: "123"),
      likesCount: 23,
    )
  ];

  List<Evento> get eventos => _eventos;
  final UserModel _usuarioAtual = UserModel(
    id: 2,
    email: "usuario@email.com", 
    name: "Usuário", 
    password: "123"
  );

  UserModel get usuarioAtual => _usuarioAtual;

  void addEvento(Evento newEvento) {
    _eventos.insert(0, newEvento);
    notifyListeners();
  }

  void deleteEvento(int eventoId) {
    _eventos.removeWhere((e) => e.id == eventoId);
    notifyListeners();
  }

  void toggleLike(int eventoId) {
    final evento = _eventos.firstWhere((e) => e.id == eventoId);
    evento.isLiked = !evento.isLiked;
    evento.likesCount += evento.isLiked ? 1 : -1;
    notifyListeners();
  }

  void addComentario(int eventoId, String texto) {
    final evento = _eventos.firstWhere((e) => e.id == eventoId);
    evento.comentarios.add(Comentario(
      id: DateTime.now().millisecondsSinceEpoch,
      user: _usuarioAtual,
      text: texto,
      createdAt: DateTime.now(),
    ));
    notifyListeners();
  }

  bool isDonoEvento(Evento evento) {
    return evento.user.id == _usuarioAtual.id;
  }

  void mostrarOpcoesEvento(BuildContext context, Evento evento) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF222225),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isDonoEvento(evento))
            _buildOpcaoMenu(
              Icons.delete, 
              'Excluir', 
              Colors.red, 
              () {
                _confirmarExclusao(context, evento);
              }
            ),
          _buildOpcaoMenu(
            Icons.report, 
            'Denunciar', 
            Colors.orange, 
            () {
              _mostrarSnackbar(context, 'Evento denunciado!', Colors.orange);
            }
          ),
          _buildOpcaoMenu(
            Icons.cancel, 
            'Cancelar', 
            Colors.grey, 
            () {
              Navigator.pop(context);
            }
          ),
        ],
      ),
    );
  }

  void _confirmarExclusao(BuildContext context, Evento evento) {
    Navigator.pop(context);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF222225),
        title: const Text('Excluir Evento', style: TextStyle(color: Colors.white)),
        content: const Text('Tem certeza?', style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              deleteEvento(evento.id);
              Navigator.pop(context);
              _mostrarSnackbar(context, 'Evento excluído!', Colors.green);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void mostrarDialogComentario(BuildContext context, Evento evento) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF222225),
        title: const Text('Comentar', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Digite seu comentário...',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar', style: TextStyle(color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              final texto = controller.text.trim();
              if (texto.isNotEmpty) {
                addComentario(evento.id, texto);
                Navigator.pop(context);
                _mostrarSnackbar(context, 'Comentário adicionado!', Colors.green);
              }
            },
            child: const Text('Comentar', style: TextStyle(color: Color(0xFF45b5b7))),
          ),
        ],
      ),
    );
  }

  void compartilharEvento(BuildContext context, Evento evento) {
    _mostrarSnackbar(context, 'Compartilhando: ${evento.title}', const Color(0xFF45b5b7));
  }

  ListTile _buildOpcaoMenu(IconData icon, String texto, Color cor, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: cor),
      title: Text(texto, style: TextStyle(color: cor)),
      onTap: onTap,
    );
  }

  void _mostrarSnackbar(BuildContext context, String texto, Color cor) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto), 
        backgroundColor: cor, 
        duration: const Duration(seconds: 5)
      )
    );
  }
}