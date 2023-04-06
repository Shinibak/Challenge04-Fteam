import 'dart:convert';
import '../datasource/todo_put_datasource.dart';
import '../models/todo_model.dart';

abstract class ITodoPutRepository {
  Future putTodo(String key, List<ToDoModel> todo);
}

class TodoPutRepository implements ITodoPutRepository {
  final ITodoPutDatasource _todoPutDatasource;

  TodoPutRepository(this._todoPutDatasource);

  @override
  Future putTodo(String key, List<ToDoModel> todo) async {
    final todoMap = todo.map((e) {
      return {
        'taskTodo': e.taskTodo,
        'dateTodo': e.dateTodo,
        'isCompleted': e.isCompleted,
      };
    }).toList(); //convert to map
    final stringsTodo = json.encode(todoMap);
    await _todoPutDatasource.putDataSource(key, stringsTodo);
  }
}
