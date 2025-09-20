import 'package:fitflow_app/screens/admin/admin_program_page.dart';
import 'package:fitflow_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFlow - Page admin',
      home: AdminPage(),
    ); //DebugScreen()
  }
}
