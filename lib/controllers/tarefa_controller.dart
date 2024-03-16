import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:todo_list_flutter/bd/repository/tarefa_repository.dart';
import 'package:todo_list_flutter/models/tarefa_model.dart';

class TarefaController extends GetxController {
  final styleInput = const InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );

  final formController = GlobalKey<FormState>();
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  final dataController = TextEditingController();
  final horaController = TextEditingController();

  final TarefaRepository _repository = TarefaRepository();

  final tarefas = <Tarefas>[].obs;

  @override
  void onInit() {
    listarTarefas();
    print("ïnit TarefaController");
    super.onInit();
  }

  @override
  void onClose() {
    print("onClose TarefaController");
    super.onClose();
  }

  void salvarTarefa() {
    if (formController.currentState!.validate()) {
      Tarefas obj = Tarefas(
        titulo: tituloController.text,
        descricao: descricaoController.text,
        data: dataController.text,
        hora: horaController.text,
      );
      _repository.salvarTarefa(obj);
      listarTarefas();
      //mata controller
      tituloController.clear();
      descricaoController.clear();
      dataController.clear();
      horaController.clear();
      Get.offAndToNamed("/");
    }
  }

  void atualizarTarefa(Tarefas tarefa) {
    _repository.atualizarTarefa(tarefa);
    listarTarefas();
  }

  void listarTarefas() {
    _repository.buscarTarefas().then((value) {
      tarefas.assignAll(value);
    });
  }
}
