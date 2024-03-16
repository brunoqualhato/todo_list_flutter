class Tarefas {
  int? id;
  String? titulo;
  String? descricao;
  String? data;
  String? hora;
  bool? concluido;

  Tarefas(
      {this.id,
      this.titulo,
      this.descricao,
      this.data,
      this.hora,
      this.concluido});

  Tarefas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    data = json['data'];
    hora = json['hora'];
    concluido = json['concluido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['data'] = this.data;
    data['hora'] = hora;
    data['concluido'] = concluido;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'data': data,
      'hora': hora,
      'concluido': concluido,
    };
  }

  //FROM MAP
  Tarefas.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    titulo = map['titulo'];
    descricao = map['descricao'];
    data = map['data'];
    hora = map['hora'];
    concluido = map['concluido'] == 1;
  }
}
