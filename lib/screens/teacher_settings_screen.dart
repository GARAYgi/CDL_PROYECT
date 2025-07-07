import 'package:flutter/material.dart';

class TeacherSettingsScreen extends StatelessWidget {
  const TeacherSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajustes'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Icon(Icons.person),
              ),
              title: Text('Sophia Bennett'),
              subtitle: Text('Profesora'),
            ),
            const Divider(),
            _buildSettingsSection('Cuenta', [
              _buildSettingsItem('Perfil', Icons.person_outline),
              _buildSettingsItem('Notificaciones', Icons.notifications_none),
              _buildSettingsItem('Privacidad', Icons.lock_outline),
            ]),
            _buildSettingsSection('Ajustes de la App', [
              _buildSettingsItem('General', Icons.settings_outlined),
              _buildSettingsItem('Idioma', Icons.language),
            ]),
            _buildSettingsSection('Soporte', [
              _buildSettingsItem('Centro de Ayuda', Icons.help_outline),
              _buildSettingsItem('Contáctanos', Icons.mail_outline),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 3),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        ...items,
        const Divider(),
      ],
    );
  }

  Widget _buildSettingsItem(String title, IconData icon) {
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
        BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Aulas'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Mensajes'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
      ],
      onTap: (index) {
        // Implementar navegación según sea necesario
      },
    );
  }
}