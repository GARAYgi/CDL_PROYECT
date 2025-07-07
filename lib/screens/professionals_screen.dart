// 3. professionals_screen.dart
import 'package:flutter/material.dart';

class ProfessionalsScreen extends StatelessWidget {
  const ProfessionalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profesionales'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Buscar profesionales...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            _buildProfessionalSection('Terapeutas', [
              _buildProfessionalCard('Dra. Amelia Harper', 'Psicóloga Infantil'),
              _buildProfessionalCard('Dr. Ethan Carter', 'Terapeuta del Habla'),
              _buildProfessionalCard('Dra. Olivia Bennett', 'Terapeuta Ocupacional'),
            ]),
            _buildProfessionalSection('Dentistas', [
              _buildProfessionalCard('Dr. Noah Thompson', 'Dentista Pediátrico'),
              _buildProfessionalCard('Dra. Sophia Evans', 'Ortodoncista'),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 2),
    );
  }

  Widget _buildProfessionalSection(String title, List<Widget> professionals) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...professionals,
      ],
    );
  }

  Widget _buildProfessionalCard(String name, String specialty) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: IconButton(
          icon: const Icon(Icons.message),
          onPressed: () {},
        ),
      ),
    );
  }

  BottomNavigationBar _buildBottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profesionales'),
        BottomNavigationBarItem(icon: Icon(Icons.library_books), label: 'Recursos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      onTap: (index) {
        // Navegación entre pantallas
        if (index == 0) Navigator.pushReplacementNamed(context, '/home');
        if (index == 1) Navigator.pushReplacementNamed(context, '/professionals');
        if (index == 2) Navigator.pushReplacementNamed(context, '/resources');
        if (index == 3) Navigator.pushReplacementNamed(context, '/profile');
      },
    );
  }
}