// views/addevento_view.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/postevento_model.dart';
import '../model/user_model.dart';

class AddEventoView extends StatefulWidget {
  final Function(Evento) onEventoCriado;
  final UserModel usuarioAtual;

  const AddEventoView({
    super.key,
    required this.onEventoCriado,
    required this.usuarioAtual,
  });

  @override
  State<AddEventoView> createState() => _AddEventoViewState();
}

class _AddEventoViewState extends State<AddEventoView> {
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _localController = TextEditingController();
  
  DateTime _dataEvento = DateTime.now().add(const Duration(days: 1));
  TimeOfDay _horaEvento = TimeOfDay.now();

Future<void> _selecionarData() async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: _dataEvento,
    firstDate: DateTime.now(),
    lastDate: DateTime(2100),
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF45b5b7),
            onPrimary: Colors.white,
            surface: Color(0xFF111112),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null) {
    setState(() {
      _dataEvento = picked;
    });
  }
}

Future<void> _selecionarHora() async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: _horaEvento,
    builder: (context, child) {
      return Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF45b5b7),
            onPrimary: Colors.white,
            surface: Color(0xFF111112),
            onSurface: Colors.white,
          ),
        ),
        child: child!,
      );
    },
  );
  if (picked != null) {
    setState(() {
      _horaEvento = picked;
    });
  }
}

  void _criarEvento() {
    if (_tituloController.text.isEmpty || _descricaoController.text.isEmpty) {
      // Mostra mensagem de erro se campos estiverem vazios
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Preencha título e descrição'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Combina data e hora
    final dataHoraCompleta = DateTime(
      _dataEvento.year,
      _dataEvento.month,
      _dataEvento.day,
      _horaEvento.hour,
      _horaEvento.minute,
    );

    // Cria o novo evento
    final novoEvento = Evento(
      id: DateTime.now().millisecondsSinceEpoch,
      title: _tituloController.text,
      description: _descricaoController.text,
      date: dataHoraCompleta,
      location: _localController.text,
      imageUrl: "https://",
      user: widget.usuarioAtual,
    );

    // chama a função para adicionar o evento
    widget.onEventoCriado(novoEvento);
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
                  'Novo Evento',
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

            // Título
            TextField(
              controller: _tituloController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Título',
                labelStyle: TextStyle(color: Color(0xFF45b5b7)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45b5b7)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Descrição
            TextField(
              controller: _descricaoController,
              style: const TextStyle(color: Colors.white),
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                labelStyle: TextStyle(color: Color(0xFF45b5b7)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45b5b7)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Local
            TextField(
              controller: _localController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Local (opcional)',
                labelStyle: TextStyle(color: Color(0xFF45b5b7)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF45b5b7)),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Data e Hora
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _selecionarData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF45b5b7),
                    ),
                    icon: const Icon(Icons.calendar_today, size: 18, color: Colors.white),
                    label: Text(
                      DateFormat('dd/MM/yyyy').format(_dataEvento),
                      style: TextStyle(
                        color: Colors.white
                      ),
                      
                      ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _selecionarHora,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF45b5b7),
                    ),
                    icon: const Icon(Icons.access_time, size: 18, color: Colors.white),
                    label: Text(
                      _horaEvento.format(context),
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Botão Criar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _criarEvento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF45b5b7),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  'Criar Evento',
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