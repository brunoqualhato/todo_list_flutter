import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  final String _nomeBancoDados = "pltfmCRV.db";
  final int _versaoBancoDados = 2;

  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    String caminhoBancoDados = join(path, _nomeBancoDados);

    return openDatabase(
      caminhoBancoDados,
      onCreate: (database, version) async {
        //tabela para lista de tarefas
        await database.execute(
          "CREATE TABLE if not exists tarefas (id INTEGER PRIMARY KEY AUTOINCREMENT, titulo TEXT, descricao TEXT, data TEXT, hora TEXT, concluido INTEGER)"
        );
      },
      version: _versaoBancoDados,
    );
  }

  

}