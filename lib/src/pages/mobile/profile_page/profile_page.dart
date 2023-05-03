import 'package:challenge04_fteam/src/pages/desktop/home_page/home_desktop_page.dart';
import 'package:challenge04_fteam/src/pages/responsive_layout.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/chat_controller.dart';
import '../../../controllers/todo_controller.dart';
import '../../../datasource/local_service/hive_local_storage_service.dart';
import '../../../datasource/todo_get_datasource.dart';
import '../../../datasource/todo_put_datasource.dart';
import '../../../repositories/todo_get_repository.dart';
import '../../../repositories/todo_put_repository.dart';
import 'widgets/todo_form_mobile_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late TodoController controller;
  late ChatController chatController;

  @override
  void dispose() {
    super.dispose();
    chatController.openProfile();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: cast_nullable_to_non_nullable
    chatController = context.watch<ChatController>();
    final screenSize = MediaQuery.of(context).size.width;

    final hiveService = HiveLocalStorageService();
    final getDatasource = TodoGetDatasource(hiveService);
    final putDatasource = TodoPutDatasource(hiveService);
    final getRepository = TodoGetRepository(getDatasource);
    final putRepository = TodoPutRepository(putDatasource);
    final controller = TodoController(putRepository, getRepository);
    controller.getTodo(chatController.getProfile().name);

    return ResponsiveLayout(
      mobile: Scaffold(
        body: Column(
          children: [
            ProfileCardWidget(
              avatarImage: chatController.getProfile().avatarImage,
              name: chatController.getProfile().name,
              isOnline: chatController.getProfile().isOnline,
              number: chatController.getProfile().number,
              status: chatController.getProfile().status,
              skills: chatController.getProfile().skills,
              screenSize: screenSize,
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: screenSize * 0.064),
                    itemCount: controller.returnToDoList().length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: screenSize * 0.026,
                          left: screenSize * 0.048,
                        ),
                        child: TodoItemMobileWidget(
                          taskName: controller.returnToDoList()[index].taskTodo,
                          date: controller.returnToDoList()[index].dateTodo,
                          taskCompleted:
                              controller.returnToDoList()[index].isCompleted,
                          screenSize: screenSize,
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
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              Theme.of(context).floatingActionButtonTheme.backgroundColor,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (_) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: TodoFormMobileWidget(
                  onRefreshScreen: controller.saveNewTask,
                  screenSize: screenSize,
                ),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
      desktop: const HomeDesktopPage(),
    );
  }
}
