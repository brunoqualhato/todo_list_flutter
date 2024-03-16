import 'package:sqflite/sqflite.dart';
import 'package:todo_list_flutter/bd/database_helper.dart';
import 'package:todo_list_flutter/models/tarefa_model.dart';

class TarefaRepository {
  final _tarefas = <Tarefas>[];
  final db = DataBaseHelper();

  Future<void> salvarTarefa(Tarefas tarefa) async {
    final database = await db.initializeDB();
    await database.insert('tarefas', tarefa.toMap());
  }

  Future<void> atualizarTarefa(Tarefas tarefa) async {
    final database = await db.initializeDB();
    await database.update(
      'tarefas',
      tarefa.toMap(),
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  Future<void> deletarTarefa(int id) async {
    final database = await db.initializeDB();
    await database.delete(
      'tarefas',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Tarefas>> buscarTarefas() async {
    final database = await db.initializeDB();
    final result = await database.query('tarefas');
    return result.map((e) => Tarefas.fromMap(e)).toList();
  }

  Future<void> deletarTodasTarefas() async {
    final database = await db.initializeDB();
    await database.delete('tarefas');
  }

  
}
