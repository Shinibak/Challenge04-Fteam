import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../controllers/todo_controller.dart';
import '../../datasource/local_service/hive_local_storage_service.dart';
import '../../datasource/todo_get_datasource.dart';
import '../../datasource/todo_put_datasource.dart';
import '../../models/profile_model.dart';
import '../../repositories/todo_get_repository.dart';
import '../../repositories/todo_put_repository.dart';

class ProfileDesktopWidget extends StatefulWidget {
  final ProfileModel profile;
  final double screenSize;
  const ProfileDesktopWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  @override
  State<ProfileDesktopWidget> createState() => _ProfileDesktopWidgetState();
}

class _ProfileDesktopWidgetState extends State<ProfileDesktopWidget> {
  late TodoController controller;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    final hiveService = HiveLocalStorageService();
    final getDatasource = TodoGetDatasource(hiveService);
    final putDatasource = TodoPutDatasource(hiveService);
    final getRepository = TodoGetRepository(getDatasource);
    final putRepository = TodoPutRepository(putDatasource);
    final controller = TodoController(putRepository, getRepository);
    controller.getTodo(widget.profile.name);

    return Column(
      children: [
        ProfileCardDesktopWidget(
          avatarImage: widget.profile.avatarImage,
          name: widget.profile.name,
          isOnline: widget.profile.isOnline,
          number: widget.profile.number,
          status: widget.profile.status,
          skills: widget.profile.skills,
          screenSize: widget.screenSize,
        ),
        SizedBox(height: widget.screenSize * 0.033203125),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Attachments', style: textStyle.subtitle2),
            ),
            Icon(Icons.expand_more, size: widget.screenSize * 0.013671875),
          ],
        ),
        SizedBox(height: widget.screenSize * 0.03125),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Links', style: textStyle.subtitle2),
            ),
            Icon(Icons.expand_more, size: widget.screenSize * 0.013671875),
          ],
        ),
        SizedBox(height: widget.screenSize * 0.03125),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('All Vacancies', style: textStyle.subtitle2),
            ),
            Icon(Icons.expand_more, size: widget.screenSize * 0.013671875),
          ],
        ),
        SizedBox(height: widget.screenSize * 0.03125),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text('Appointments', style: textStyle.subtitle2),
            ),
            Icon(Icons.expand_more, size: widget.screenSize * 0.013671875),
          ],
        ),
        SizedBox(height: widget.screenSize * 0.01953125),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.only(top: widget.screenSize * 0.064),
            itemCount: controller.returnToDoList().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: widget.screenSize * 0.009765625,
                ),
                child: TodoItemDesktopWidget(
                  taskName: controller.returnToDoList()[index].taskTodo,
                  date: controller.returnToDoList()[index].dateTodo,
                  taskCompleted: controller.returnToDoList()[index].isCompleted,
                  screenSize: widget.screenSize,
                  onChanged: (value) =>
                      controller.checkBoxChanged(value, index),
                  deletedFunction: (context) => controller.deletedTask(index),
                  validate: controller.validarData(
                    DateTime.parse(controller.returnToDoList()[index].dateTodo),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
