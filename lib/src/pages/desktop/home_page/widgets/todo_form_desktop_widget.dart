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
  late DateTime dateTime;
  late DateTime reservedDate;
  bool state = true;

  @override
  void initState() {
    super.initState();
    dateTime = DateTime.now();
    reservedDate = dateTime;
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
    late final bool _state;
    final valiDate = DateTime.now();
    if (dateTime.year == valiDate.year &&
        dateTime.month == valiDate.month &&
        dateTime.day == valiDate.day) {
      if (dateTime.hour <= valiDate.hour) {
        if (dateTime.minute <= valiDate.minute) {
          setState(() {
            state = false;
          });
          _state = false;
        } else {
          _state = true;
        }
      } else {
        _state = true;
      }
    } else {
      _state = true;
    }
    return _state;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    final textStyle = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: theme.profileCardTheme,
      ),
      width: 300,
      child: Form(
        key: _formKey,
        child: Column(
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
                    style: state ? textStyle.subtitle1 : theme.buttonError,
                  ),
                ),
                SizedBox(width: widget.screenSize * 0.01),
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
            if (state == false)
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
                        validatorData() == true) {
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
        ),
      ),
    );
  }
}
