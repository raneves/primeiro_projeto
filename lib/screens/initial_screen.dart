import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/task_inherited.dart';
import 'package:primeiro_projeto/screens/form_screen.dart';

class InitialScrenn extends StatefulWidget {
  const InitialScrenn({super.key});

  @override
  State<InitialScrenn> createState() => _InitialScrennState();
}

class _InitialScrennState extends State<InitialScrenn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefas'),
        leading: Container(),
        backgroundColor: Colors.blue, // Cor de fundo azul
      ),
      body: ListView(
        children: TaskInherited.of(context).taskList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextNew) => FormScreen(taskContext: context,)),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
