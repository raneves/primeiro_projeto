import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class InitialScrenn extends StatefulWidget {
  const InitialScrenn({super.key});

  @override
  State<InitialScrenn> createState() => _InitialScrennState();
}


class _InitialScrennState extends State<InitialScrenn> {
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        leading: Container(),
        backgroundColor: Colors.blue, // Cor de fundo azul
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Tasks(
              'Estudar Flutter',
              'assets/images/livro.jpg',
              3,
            ),
            Tasks(
              'Estudar Dart',
              'assets/images/livro.jpg',
              2,
            ),
            Tasks(
              'Ler java',
              'assets/images/dash.png',
              1,
            ),
            Tasks(
              'Estudar Spring',
              'assets/images/dash.png',
              5,
            ),
            Tasks(
              'Estudar Spring',
              'assets/images/dash.png',
              5,
            ),
            Tasks(
              'Estudar Spring',
              'assets/images/dash.png',
              5,
            ),
            Tasks(
              'Estudar Spring',
              'assets/images/dash.png',
              5,
            ),
            SizedBox(height: 80,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //print("Você clicou no botão!");
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: Icon(Icons.remove_red_eye),
      ),
    );
  }
}