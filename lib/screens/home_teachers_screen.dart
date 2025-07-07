import 'package:centro_deasarrollo_infantil/screens/add_update_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/assistant_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/classrooms_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/teacher_settings_screen.dart';
import 'package:flutter/material.dart';


class HomeTeachersScreen extends StatelessWidget {
  const HomeTeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Profesores'),
        backgroundColor: const Color(0xFFF0F3F4),
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Tarjeta de bienvenida para profesores
            _buildTeacherWelcomeCard(context),
            const SizedBox(height: 20),
            
            // Accesos rápidos específicos para profesores
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Herramientas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildTeacherQuickAccessCard(
                  context,
                  'Mis Aulas',
                  Icons.school,
                  const Color(0xFF47B4EA),
                  const ClassroomsScreen(),
                ),
                _buildTeacherQuickAccessCard(
                  context,
                  'Enviar Actualización',
                  Icons.note_add,
                  const Color(0xFF6AC259),
                  const AddUpdateScreen(),
                ),
                _buildTeacherQuickAccessCard(
                  context,
                  'Asistente',
                  Icons.assistant,
                  const Color(0xFFFFA726),
                  const AssistantScreen(),
                ),
                _buildTeacherQuickAccessCard(
                  context,
                  'Configuración',
                  Icons.settings,
                  const Color(0xFF9575CD),
                  const TeacherSettingsScreen(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Próximas actividades (versión profesores)
            _buildTeacherUpcomingActivities(),
          ],
        ),
      ),
      bottomNavigationBar: _buildTeacherBottomNavBar(context, 0),
    );
  }

  Widget _buildTeacherWelcomeCard(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/teacher_avatar.png'),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¡Bienvenido/a Profesor/a!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const Text('Centro Cigüeñas'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTeacherStatItem('Aulas', '2'),
                _buildTeacherStatItem('Estudiantes', '24'),
                _buildTeacherStatItem('Mensajes', '5'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeacherStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF637C88),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherQuickAccessCard(
      BuildContext context, String title, IconData icon, Color color, Widget screen) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 30, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeacherUpcomingActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Próximas Actividades',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                _buildTeacherActivityItem('Reunión de profesores', 'Hoy, 4:00 PM'),
                const Divider(),
                _buildTeacherActivityItem('Entrega de informes', 'Mañana, 9:00 AM'),
                const Divider(),
                _buildTeacherActivityItem('Taller para padres', 'Viernes, 5:30 PM'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTeacherActivityItem(String title, String time) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.event, color: Color(0xFF47B4EA)),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      subtitle: Text(
        time,
        style: const TextStyle(color: Color(0xFF637C88)),
      ),
      trailing: const Icon(Icons.chevron_right, color: Color(0xFF47B4EA)),
    );
  }

  BottomNavigationBar _buildTeacherBottomNavBar(BuildContext context, int currentIndex) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF47B4EA),
      unselectedItemColor: const Color(0xFF637C88),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Aulas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Mensajes',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ajustes',
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ClassroomsScreen()),
          );
        } else if (index == 3) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeacherSettingsScreen()),
          );
        }
        // Para el índice 0 (Home) y 2 (Mensajes) permanecemos en la misma pantalla
      },
    );
  }
}