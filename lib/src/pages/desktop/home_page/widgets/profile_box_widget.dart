import 'package:challenge04_fteam/src/pages/desktop/home_page/widgets/todo_form_desktop_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../controllers/todo_controller.dart';
import '../../../../datasource/local_service/hive_local_storage_service.dart';
import '../../../../datasource/todo_get_datasource.dart';
import '../../../../datasource/todo_put_datasource.dart';
import '../../../../models/profile_model.dart';
import '../../../../repositories/todo_get_repository.dart';
import '../../../../repositories/todo_put_repository.dart';
import '../../../mobile/profile_page/widgets/todo_form_mobile_widget.dart';

class ProfileBoxDesktopWidget extends StatefulWidget {
  final ProfileModel profile;
  final double screenSize;
  const ProfileBoxDesktopWidget({
    super.key,
    required this.profile,
    required this.screenSize,
  });

  @override
  State<ProfileBoxDesktopWidget> createState() =>
      _ProfileBoxDesktopWidgetState();
}

class _ProfileBoxDesktopWidgetState extends State<ProfileBoxDesktopWidget> {
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

    return SizedBox(
      width: widget.screenSize * 0.234375,
      child: Stack(
        children: [
          Expanded(
            child: Column(
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
                    Icon(
                      Icons.expand_more,
                      size: widget.screenSize * 0.013671875,
                    ),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.03125),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Links', style: textStyle.subtitle2),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: widget.screenSize * 0.013671875,
                    ),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.03125),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('All Vacancies', style: textStyle.subtitle2),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: widget.screenSize * 0.013671875,
                    ),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.03125),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('Appointments', style: textStyle.subtitle2),
                    ),
                    Icon(
                      Icons.expand_more,
                      size: widget.screenSize * 0.013671875,
                    ),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.01953125),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.returnToDoList().length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              bottom: widget.screenSize * 0.009765625,
                            ),
                            child: TodoItemDesktopWidget(
                              taskName:
                                  controller.returnToDoList()[index].taskTodo,
                              date: controller.returnToDoList()[index].dateTodo,
                              taskCompleted: controller
                                  .returnToDoList()[index]
                                  .isCompleted,
                              screenSize: widget.screenSize,
                              onChanged: (value) =>
                                  controller.checkBoxChanged(value, index),
                              deletedFunction: (context) =>
                                  controller.deletedTask(index),
                              validate: controller.validData(
                                DateTime.parse(
                                  controller.returnToDoList()[index].dateTodo,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor:
                  Theme.of(context).floatingActionButtonTheme.backgroundColor,
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: TodoFormDesktopWidget(
                    onRefreshScreen: controller.saveNewTask,
                    screenSize: widget.screenSize,
                  ),
                ),
              ),
              child: Icon(
                Icons.add,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
