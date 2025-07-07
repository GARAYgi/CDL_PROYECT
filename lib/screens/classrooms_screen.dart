import 'package:flutter/material.dart';

class ClassroomsScreen extends StatelessWidget {
  const ClassroomsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aulas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Aulas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            _buildClassroomChip('Pre-K'),
            _buildClassroomChip('Kindergarten'),
            _buildClassroomChip('1er Grado'),
            const SizedBox(height: 20),
            _buildClassroomSection('Pre-K A', [
              _buildStudentCard('Sophia Clark', 4),
              _buildStudentCard('Ethan Miller', 4),
              _buildStudentCard('Olivia Davis', 4),
              _buildStudentCard('Noah Wilson', 4),
            ]),
            _buildClassroomSection('Pre-K B', [
              _buildStudentCard('Isabella Brown', 4),
              _buildStudentCard('Liam Taylor', 4),
              _buildStudentCard('Mia Evans', 4),
              _buildStudentCard('Lucas Moore', 4),
            ]),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context, 1),
    );
  }

  Widget _buildClassroomChip(String name) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Chip(
        label: Text(name),
        backgroundColor: const Color(0xFFF0F3F4),
      ),
    );
  }

  Widget _buildClassroomSection(String name, List<Widget> students) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Divider(),
        ...students,
      ],
    );
  }

  Widget _buildStudentCard(String name, int age) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name),
        subtitle: Text('Edad: $age años'),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward),
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