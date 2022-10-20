import 'package:flutter/material.dart';
import 'package:lightbulb/dependency_container.dart';
import 'package:lightbulb/ui/pages/home/page.dart';

Future<void> main() async {
  await setupDependencies();

  runApp(const LightbulbApp());
}

class LightbulbApp extends StatelessWidget {
  const LightbulbApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TechTalk BLoC',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}
