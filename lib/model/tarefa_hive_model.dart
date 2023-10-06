import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'tarefa_hive_model.g.dart';

@HiveType(typeId: 1)
class TarefaHiveModel extends HiveObject {
  @HiveField(0)
  String descricao = "";
  @HiveField(1)
  bool concluido = false;
  @HiveField(2)
  final String _id = UniqueKey().toString();

  TarefaHiveModel();

  TarefaHiveModel.criar(this.descricao, this.concluido);

  String get id => _id;
}
