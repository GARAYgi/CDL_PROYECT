import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistente de Desarrollo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildMessageBubble(
                  'Asistente',
                  '¡Hola! ¿Cómo puedo ayudarte hoy con el desarrollo infantil?',
                  true,
                ),
                _buildMessageBubble(
                  'Profesor',
                  'Necesito algunas ideas para actividades que mejoren las habilidades motoras finas en preescolares.',
                  false,
                ),
                _buildMessageBubble(
                  'Asistente',
                  '¡Claro! Aquí tienes algunas ideas:\n\n'
                  '1. Esculpir con plastilina: Usa plastilina para crear formas, animales o letras.\n'
                  '2. Ensartar cuentas: Ensarta cuentas en un hilo para hacer collares o pulseras.\n'
                  '3. Practicar cortar: Proporciona tijeras seguras y papel para cortar formas o líneas.',
                  true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Haz una pregunta...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String sender, String message, bool isAssistant) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isAssistant)
            const CircleAvatar(
              child: Icon(Icons.face),
            ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: isAssistant
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(
                  sender,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isAssistant
                        ? const Color(0xFFF0F3F4)
                        : const Color(0xFF47B4EA),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(message),
                ),
              ],
            ),
          ),
          if (!isAssistant) const SizedBox(width: 8),
          if (!isAssistant)
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
        ],
      ),
    );
  }
}