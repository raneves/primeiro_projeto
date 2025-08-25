import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';
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
        children: const [
          Tasks('Estudar Flutter', 'assets/images/livro.jpg', 3),
          Tasks('Estudar Dart', 'assets/images/livro.jpg', 2),
          Tasks('Ler java', 'assets/images/dash.png', 1),
          Tasks('Estudar Spring', 'assets/images/dash.png', 5),

          SizedBox(height: 80),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
