// 2. activities_screen.dart
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividades'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Actividades Recomendadas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildActivityCard(
              'Construcción con Bloques',
              'Fomenta la creatividad y resolución de problemas construyendo estructuras con bloques.',
            ),
            _buildActivityCard(
              'Lectura Compartida',
              'Pasa tiempo de calidad leyendo en voz alta a tu hijo para su desarrollo.',
            ),
            const SizedBox(height: 24),
            const Text(
              'Más Actividades',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            _buildCategoryActivity('Juego Sensorial', 'Diversión con Plastilina',
                'Engancha los sentidos de tu hijo con plastilina casera o comprada. Experimenta con colores y texturas.'),
            _buildCategoryActivity('Juego al Aire Libre', 'Paseos por la Naturaleza',
                'Explora el exterior con tu hijo. Recolecta hojas, piedras y otros objetos naturales para discutir y aprender.'),
            _buildCategoryActivity('Artes Creativas', 'Pintura con Dedos',
                'Permite que tu hijo se exprese mediante pintura con dedos. Usa pinturas no tóxicas y papel grande para fácil limpieza.'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 1),
    );
  }

  Widget _buildActivityCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(description),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryActivity(String category, String title, String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          category,
          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        _buildActivityCard(title, description),
      ],
    );
  }

  BottomNavigationBar _buildBottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Actividades'),
        BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Progreso'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      onTap: (index) {
        // Navegación entre pantallas
        if (index == 0) Navigator.pushReplacementNamed(context, '/home');
        if (index == 1) Navigator.pushReplacementNamed(context, '/activities');
        if (index == 2) Navigator.pushReplacementNamed(context, '/progress');
        if (index == 3) Navigator.pushReplacementNamed(context, '/profile');
      },
    );
  }
}