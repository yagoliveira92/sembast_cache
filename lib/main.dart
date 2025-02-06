import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sembast_cache/src/core/local_storage_adapter/local_storage_adapter.dart';
import 'package:sembast_cache/src/feature/home_screen/view/welcome_screen.dart';
import 'package:sembast_cache/src/core/containers/injection_container.dart'
    as injection;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injection.init();
  final localStorageAdapter = injection.dependency.get<LocalStorageAdapter>();
  await localStorageAdapter.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimaTempo',
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(
            0xFF7693FF,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
            size: 28,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                vertical: 10,
              ),
            ),
            backgroundColor: WidgetStateProperty.all(
              const Color(0xFF7693FF),
            ),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}
