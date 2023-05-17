import 'package:challenge04_fteam/src/controllers/date_controller.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TodoFormDesktopWidget extends StatefulWidget {
  Function(DateTime, String)? onRefreshScreen;
  final double screenSize;
  TodoFormDesktopWidget({
    super.key,
    required this.screenSize,
    required this.onRefreshScreen,
  });

  @override
  State<TodoFormDesktopWidget> createState() => _TodoFormDesktopWidgetState();
}

class _TodoFormDesktopWidgetState extends State<TodoFormDesktopWidget> {
  final taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateController dateController;
  late DateTime dateTime;
  late DateTime reservedDate;

  @override
  void initState() {
    super.initState();
    dateController = DateController();
    dateController
      ..dateTime = DateTime.now()
      ..reservedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final textStyle = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.profileCardTheme,
      ),
      width: 300,
      child: Form(
        key: _formKey,
        child: AnimatedBuilder(
          animation: dateController,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: widget.screenSize * 0.015),
                Row(
                  children: [
                    SizedBox(width: widget.screenSize * 0.015),
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    SizedBox(width: widget.screenSize * 0.01),
                    Text('Add New Task', style: textStyle.headline5),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.0001),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller: taskController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: widget.screenSize * 0.01),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          theme.profileButton!,
                        ),
                      ),
                      onPressed: () => dateController.pickDatePress(context),
                      child: Text(
                        '${dateController.hours}:${dateController.minutes}',
                        style: dateController.state
                            ? textStyle.subtitle1
                            : theme.buttonError,
                      ),
                    ),
                    SizedBox(width: widget.screenSize * 0.01),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          theme.profileButton!,
                        ),
                      ),
                      onPressed: () => dateController.pickTimePress(context),
                      child: Text(
                        '${dateController.dateTime.day}/${dateController.dateTime.month}/${dateController.dateTime.year}',
                        style: textStyle.subtitle1,
                      ),
                    ),
                  ],
                ),
                if (dateController.state == false)
                  Text(
                    'Hora invalida',
                    style: TextStyle(
                      color: theme.deleted,
                    ),
                  ),
                SizedBox(height: widget.screenSize * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          theme.profileButton!,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() == true &&
                            dateController.validatorData() == true) {
                          setState(() {
                            widget.onRefreshScreen!(
                              dateTime,
                              taskController.text,
                            );
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Save',
                        style: textStyle.subtitle1,
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          theme.profileButton!,
                        ),
                      ),
                      onPressed: () {
                        dateTime = DateTime.now();
                        reservedDate = dateTime;
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancel',
                        style: textStyle.subtitle1,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: widget.screenSize * 0.01),
              ],
            );
          },
        ),
      ),
    );
  }
}
