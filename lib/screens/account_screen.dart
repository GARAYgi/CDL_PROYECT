// 4. account_screen.dart
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuenta'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Detalles de la Cuenta'),
          _buildListTile('Gestionar detalles de la cuenta', Icons.account_circle),
          _buildListTile('Gestionar suscripción', Icons.payment),
          const Divider(),
          _buildSectionTitle('Preferencias'),
          _buildListTile('Notificaciones', Icons.notifications),
          _buildListTile('Idioma', Icons.language),
          const Divider(),
          _buildSectionTitle('Soporte'),
          _buildListTile('Ayuda y Soporte', Icons.help),
          _buildListTile('Acerca de', Icons.info),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 3),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildListTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }

  BottomNavigationBar _buildBottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Actividades'),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Comunidad'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
      onTap: (index) {
        // Navegación entre pantallas
        if (index == 0) Navigator.pushReplacementNamed(context, '/home');
        if (index == 1) Navigator.pushReplacementNamed(context, '/activities');
        if (index == 2) Navigator.pushReplacementNamed(context, '/community');
        if (index == 3) Navigator.pushReplacementNamed(context, '/profile');
      },
    );
  }
}