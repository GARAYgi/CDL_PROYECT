import 'package:centro_deasarrollo_infantil/screens/account_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/activities_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/add_update_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/assistant_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/child_profile_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/classrooms_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/home_parents_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/login_parents_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/login_teacher_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/professionals_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/teacher_settings_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cigüeñas',
      theme: ThemeData(fontFamily: 'Spline Sans', primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/loginParents': (context) => const LoginParentsScreen(),
        '/loginTeachers': (context) => const LoginTeachersScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ChildProfileScreen(),
        '/activities': (context) => const ActivitiesScreen(),
        '/professionals': (context) => const ProfessionalsScreen(),
        '/account': (context) => const AccountScreen(),
        '/teacher/classrooms': (context) => const ClassroomsScreen(),
        '/teacher/addUpdate': (context) => const AddUpdateScreen(),
        '/teacher/assistant': (context) => const AssistantScreen(),
        '/teacher/settings': (context) => const TeacherSettingsScreen(),
        // Agrega más rutas según sea necesario
      },
    );
  }
}
