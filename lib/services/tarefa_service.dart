import 'package:todo_list_flutter/bd/repository/tarefa_repository.dart';
import 'package:todo_list_flutter/models/tarefa_model.dart';

class TarefaService {
  final TarefaRepository _repository;

  TarefaService(this._repository);

  Future<void> salvarTarefa(Tarefas tarefa) async {
    await _repository.salvarTarefa(tarefa);
  }

  Future<void> atualizarTarefa(Tarefas tarefa) async {
    await _repository.atualizarTarefa(tarefa);
  }

  Future<void> deletarTarefa(int id) async {
    await _repository.deletarTarefa(id);
  }

  Future<List<Tarefas>> buscarTarefas() async {
    return await _repository.buscarTarefas();
  }
}