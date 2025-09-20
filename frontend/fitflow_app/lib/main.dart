import 'package:fitflow_app/screens/admin/admin_program_page.dart';
import 'package:fitflow_app/screens/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      // ⬅️ C'est ça qui manquait
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitFlow Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = const [
    AdminPage(),
    ProgramsListPage(),
    ExercisesListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FitFlow Admin")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Navigation", style: TextStyle(color: Colors.white)),
            ),
            ListTile(
              title: const Text("Formulaire Admin"),
              onTap: () {
                setState(() => _selectedPageIndex = 0);
                Navigator.pop(context); // ferme le drawer
              },
            ),
            ListTile(
              title: const Text("Liste des Programmes"),
              onTap: () {
                setState(() => _selectedPageIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Liste des Exercices"),
              onTap: () {
                setState(() => _selectedPageIndex = 2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedPageIndex],
    );
  }
}
