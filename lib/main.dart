import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_list_flutter/telas/home.dart';
import 'package:todo_list_flutter/telas/nova_tarefa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tarefas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/tarefa/novo', page: () => const NovaTarefa()),
      ],
    );
  }
}
