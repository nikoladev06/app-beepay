import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../model/professionalpost_model.dart';
import '../controller/addprofessionalpost_controller.dart';

class AddProfessionalPostView extends StatefulWidget {
  final Function(ProfessionalPost) onProfessionalPostCriado;
  final UserModel usuarioAtual;

  const AddProfessionalPostView({
    super.key,
    required this.onProfessionalPostCriado,
    required this.usuarioAtual,
  });

  @override
  State<AddProfessionalPostView> createState() => _AddProfessionalPostViewState();
}

class _AddProfessionalPostViewState extends State<AddProfessionalPostView> {
  final _controller = AddProfessionalPostController();

  void _criarProfessionalPost() {
    if (!_controller.validarFormulario()) {
      // Mostra mensagem de erro se a descrição estiver vazia
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha a descrição da vaga'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Cria o novo post usando o controller
    final novoPost = _controller.createProfessionalPost(widget.usuarioAtual);

    // Chama a função para adicionar o post
    widget.onProfessionalPostCriado(novoPost);
    _controller.limparFormulario(); // Limpa o formulário
    Navigator.of(context).pop(); // fecha o modal
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Cabeçalho
            Row(
              children: [
                const Text(
                  'Nova Vaga/Oportunidade',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 20),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Descrição
            TextField(
              controller: _controller.descriptionController,
              style: const TextStyle(color: Colors.white),
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Descrição da vaga',
                labelStyle: TextStyle(color: Color(0xFF45b5b7)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45b5b7)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Botão Criar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _criarProfessionalPost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF45b5b7),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Publicar',
                  style: TextStyle(
                    fontSize: 16, 
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}