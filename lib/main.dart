import 'package:flutter/material.dart';
import 'package:lab2_app_sismo/config/theme/app_theme.dart';
import 'package:lab2_app_sismo/presentation/screens/sismo_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Sismo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const SismoScreen());
  }
}
