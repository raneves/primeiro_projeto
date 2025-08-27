import 'package:flutter/material.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';
import 'package:primeiro_projeto/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro projeto flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TaskInherited(child: const InitialScrenn()),
    );
  }
}
