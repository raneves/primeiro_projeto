import 'package:primeiro_projeto/components/task.dart';
import 'package:primeiro_projeto/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql =
      'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Tasks tarefa) async {
    print('Iniciando o Save');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('A tarefa nao existia....');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('A tarefa ja existia....');
      return await bancoDeDados.update(
        _tablename,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
    print('Finalizando o save');
  }

  Map<String, dynamic> toMap(Tasks tarefa) {
    print('Convertendo Tarefa em Map');
    final Map<String, dynamic> mapaDetarefas = Map();
    mapaDetarefas[_name] = tarefa.nome;
    mapaDetarefas[_difficulty] = tarefa.dificuldade;
    mapaDetarefas[_image] = tarefa.foto;

    print('Sucesso na conversao... $mapaDetarefas');
    return mapaDetarefas;
  }

  Future<List<Tasks>> findAll() async {
    print('Estamos acessando o findALL');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
    );
    print('Procurando dados no banco de dados .... encontrado : $result');
    return toList(result);
    ;
  }

  List<Tasks> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('Convertendo to List: ');
    final List<Tasks> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Tasks tarefa = Tasks(
        linha[_name],
        linha[_image],
        linha[_difficulty],
      );
      tarefas.add(tarefa);
    }
    print('Lista de Tarefas $tarefas');
    return tarefas;
  }

  Future<List<Tasks>> find(String nomeDaTarefa) async {
    print('Acesando o find: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
    print('Tarefa encontrada : ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('Deletando uma tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();

    return bancoDeDados.delete(
      _tablename,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
    );
  }
}
