import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:todo_list_flutter/controllers/tarefa_controller.dart';

class NovaTarefa extends StatelessWidget {
  const NovaTarefa({super.key});

  @override
  Widget build(BuildContext context) {
    TarefaController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: controller.formController,
          child: ListView(shrinkWrap: true, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.tituloController,
                    keyboardType: TextInputType.text,
                    decoration: controller.styleInput.copyWith(
                      labelText: 'Título',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.descricaoController,
                    keyboardType: TextInputType.text,
                    decoration: controller.styleInput.copyWith(
                      labelText: 'Descrição',
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.dataController,
                    keyboardType: TextInputType.text,
                    decoration: controller.styleInput.copyWith(
                      labelText: 'Data',
                    ),
                    onTap: () async {
                      DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        controller.dataController.text =
                            date.toIso8601String().split('T').first;
                      }
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: controller.horaController,
                    keyboardType: TextInputType.text,
                    decoration: controller.styleInput.copyWith(
                      labelText: 'Hora',
                    ),
                    //show hours and minutes picker
                    onTap: () async {
                      TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (time != null) {
                        controller.horaController.text = time.format(context);
                      }
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Campo obrigatório' : null,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.salvarTarefa();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
