import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'services/api_service.dart';

void main() {
  Apiservice().getTodaysToons();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: home(),
    );
  }
}
