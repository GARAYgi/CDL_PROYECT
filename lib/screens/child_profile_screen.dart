// 1. child_profile_screen.dart
import 'package:flutter/material.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del Niño'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/child_avatar.png'),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Ethan Carter',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const Center(
              child: Text(
                'Edad: 4 años | Clase: Pre-K',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildMenuButton('Progreso', Icons.timeline),
                _buildMenuButton('Citas', Icons.calendar_today),
                _buildMenuButton('Recomendaciones', Icons.recommend),
              ],
            ),
            const SizedBox(height: 24),
            const Text(
              'Áreas de Desarrollo',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildDevelopmentProgress('Lenguaje & Comunicación', 0.75),
            _buildDevelopmentProgress('Desarrollo Cognitivo', 0.6),
            _buildDevelopmentProgress('Social & Emocional', 0.85),
            _buildDevelopmentProgress('Desarrollo Físico', 0.7),
            const SizedBox(height: 24),
            const Text(
              'Actividades Recientes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildActivityItem('Sesión de Cuentacuentos', false),
            _buildActivityItem('Tiempo de Juego al Aire Libre', true),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 3),
    );
  }

  Widget _buildMenuButton(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30),
        const SizedBox(height: 4),
        Text(text),
      ],
    );
  }

  Widget _buildDevelopmentProgress(String title, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey[200],
            color: Colors.blue,
            minHeight: 10,
          ),
          Text('${(progress * 100).toInt()}%'),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, bool completed) {
    return ListTile(
      leading: Checkbox(
        value: completed,
        onChanged: (value) {},
      ),
      title: Text(title),
      subtitle: Text(completed ? 'Completado' : 'En Progreso'),
    );
  }

  BottomNavigationBar _buildBottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.child_care), label: 'Niños'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensajes'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      onTap: (index) {
        // Navegación entre pantallas
        if (index == 0) Navigator.pushReplacementNamed(context, '/home');
        if (index == 1) Navigator.pushReplacementNamed(context, '/children');
        if (index == 2) Navigator.pushReplacementNamed(context, '/messages');
        if (index == 3) Navigator.pushReplacementNamed(context, '/profile');
      },
    );
  }
}