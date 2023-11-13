import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/screens/person_list_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final colorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 247, 6, 62),
  background: const Color.fromARGB(255, 76, 57, 57),
);

final theme = ThemeData().copyWith(
  useMaterial3: true,
  scaffoldBackgroundColor: colorScheme.background,
  colorScheme: colorScheme,
  textTheme: GoogleFonts.latoTextTheme().copyWith(
    titleSmall: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleMedium: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
    titleLarge: GoogleFonts.lato(
      fontWeight: FontWeight.bold,
    ),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      theme: theme,
      home: const PersonListScreen(),
    );
  }
}
