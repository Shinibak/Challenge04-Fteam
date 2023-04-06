class ToDoModel {
  final String taskTodo;
  final String dateTodo;
  bool isCompleted;

  ToDoModel({
    required this.taskTodo,
    required this.dateTodo,
    required this.isCompleted,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) {
    return ToDoModel(
      taskTodo: json['taskTodo'],
      dateTodo: json['dateTodo'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['taskTodo'] = taskTodo;
    data['dateTodo'] = dateTodo;
    data[' isCompleted'] = isCompleted;
    return data;
  }
}
