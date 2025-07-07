import 'package:centro_deasarrollo_infantil/screens/login_parents_screen.dart';
import 'package:centro_deasarrollo_infantil/screens/login_teacher_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Image container
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 400),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage('assets/images/ciguena.jpeg'),
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 12),
                  child: Text(
                    'Bienvenido a Cigüeñas',
                    style: TextStyle(
                      color: const Color(0xFF111518),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Subtitle
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Selecciona tu rol para iniciar',
                    style: TextStyle(
                      color: const Color(0xFF111518),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Buttons
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        // Parent button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF47B4EA),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginParentsScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Padre/Madre',
                              style: TextStyle(
                                color: Color(0xFF111518),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.015,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Teacher button
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF0F3F4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginTeachersScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              'Profesores',
                              style: TextStyle(
                                color: Color(0xFF111518),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.015,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Footer
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Al continuar, usted acepta nuestros Términos de Servicio y Política de Privacidad',
                    style: TextStyle(
                      color: const Color(0xFF637C88),
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
