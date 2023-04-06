import 'dart:convert';
import '../datasource/todo_get_datasource.dart';
import '../models/todo_model.dart';

abstract class ITodoGetRepository {
  Future<List<ToDoModel>> getTodo(String key);
}

class TodoGetRepository implements ITodoGetRepository {
  final ITodoGetDatasource _todoGetDatasource;

  TodoGetRepository(this._todoGetDatasource);

  @override
  Future<List<ToDoModel>> getTodo(String key) async {
    final encode = await _todoGetDatasource.getDataSource(key);
    final dynamicList = await jsonDecode(encode);
    final list = List<Map<String, dynamic>>.from(dynamicList)
        .map<ToDoModel>(ToDoModel.fromJson)
        .toList();
    return list;
  }
}
