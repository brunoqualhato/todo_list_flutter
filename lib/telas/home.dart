import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_flutter/controllers/tarefa_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TarefaController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: Obx(() {
        if (controller.tarefas.isEmpty) {
          return const Center(
            child: Text('Nenhuma tarefa cadastrada'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.tarefas.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(controller.tarefas[index].titulo!),
                subtitle: Text(controller.tarefas[index].descricao!),
                trailing: Checkbox(
                  value: controller.tarefas[index].concluido!,
                  onChanged: (value) {
                    controller.tarefas[index].concluido = value;
                    controller.atualizarTarefa(controller.tarefas[index]);
                  },
                ),
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.offAndToNamed('/tarefa/novo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
