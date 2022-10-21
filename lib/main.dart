import 'package:flutter/material.dart';
import 'package:light_bulb/dependency_container.dart';
import 'package:light_bulb/ui/pages/home/page.dart';

Future<void> main() async {
  await setupDependencies();

  runApp(const LightBulbApp());
}

class LightBulbApp extends StatelessWidget {
  const LightBulbApp({super.key});

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
