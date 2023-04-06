// ignore_for_file: must_be_immutable, lines_longer_than_80_chars
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class TodoFormList extends StatefulWidget {
  Function(DateTime, String)? onRefreshScreen;
  final double screenSize;

  TodoFormList({
    super.key,
    required this.onRefreshScreen,
    required this.screenSize,
  });

  @override
  State<TodoFormList> createState() => _TodoFormListState();
}

class _TodoFormListState extends State<TodoFormList> {
  final taskController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime dateTime;
  // ignore: type_annotate_public_apis, prefer_typing_uninitialized_variables
  late final reservedDate;
  bool validate = true;

  @override
  void initState() {
    dateTime = DateTime.now();
    reservedDate = dateTime;

    super.initState();
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: reservedDate,
        lastDate: DateTime(3000),
      );

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ),
      );

  bool? validatorData() {
    final valiDate = DateTime.now();
    if (dateTime.year == valiDate.year &&
        dateTime.month == valiDate.month &&
        dateTime.day == valiDate.day) {
      if (dateTime.hour <= valiDate.hour) {
        if (dateTime.minute <= valiDate.minute) {
          setState(() {
            validate = false;
          });
          return false;
        } else {
          return true;
        }
      } else {
        return true;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final textStyle = Theme.of(context).textTheme;

    return Container(
      color: theme.profileCardTheme,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: widget.screenSize * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
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
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              theme.profileButton!,
                            ),
                          ),
                          onPressed: () async {
                            final time = await pickTime();

                            if (time == null) return;

                            final newDateTime = DateTime(
                              dateTime.year,
                              dateTime.month,
                              dateTime.day,
                              time.hour,
                              time.minute,
                            );
                            setState(() => dateTime = newDateTime);
                          },
                          child: Text(
                            '$hours:$minutes',
                            style: validate
                                ? textStyle.subtitle1
                                : theme.buttonError,
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              theme.profileButton!,
                            ),
                          ),
                          onPressed: () async {
                            final date = await pickDate();
                            if (date == null) return;

                            final newDateTime = DateTime(
                              date.year,
                              date.month,
                              date.day,
                              dateTime.hour,
                              dateTime.minute,
                            );

                            setState(() => dateTime = newDateTime);
                          },
                          child: Text(
                            '${dateTime.day}/${dateTime.month}/${dateTime.year}',
                            style: textStyle.subtitle1,
                          ),
                        ),
                      ],
                    ),
                    if (validate == false)
                      Text(
                        'Hora invalida',
                        style: TextStyle(
                          color: theme.deleted,
                    ),
                      ),
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
                                validatorData() == true) {
                              widget.onRefreshScreen!(
                                dateTime,
                                taskController.text,
                              );
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
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            'Cancel',
                            style: textStyle.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
