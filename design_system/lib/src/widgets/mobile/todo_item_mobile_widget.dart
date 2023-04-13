import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

import 'check_box_mobile_widget.dart';

// ignore: must_be_immutable
class TodoItemMobileWidget extends StatelessWidget {
  final String taskName;
  final String date;
  final double screenSize;
  final bool taskCompleted;
  Function(bool)? onChanged;
  Function(BuildContext)? deletedFunction;
  final bool validate;

  TodoItemMobileWidget({
    super.key,
    required this.taskName,
    required this.date,
    required this.screenSize,
    required this.taskCompleted,
    required this.onChanged,
    required this.deletedFunction,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final theme = Theme.of(context).extension<ThemeCustom>()!;
    late final String period;
    final month = DateFormat('MMM');
    late TextStyle style;
    final todoData = DateTime.parse(date);
    if (todoData.hour > 12) {
      period = 'PM';
    } else {
      period = 'AM';
    }

    if (validate) {
      if (taskCompleted) {
        style = textStyle.overline!;
      } else {
        style = theme.lateStyle!;
      }
    } else {
      style = textStyle.overline!;
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deletedFunction,
            icon: Icons.delete,
            backgroundColor: theme.deleted!,
          ),
        ],
      ),
      child: Container(
        height: screenSize * 0.170,
        width: screenSize * 0.901,
        decoration: BoxDecoration(
          color: taskCompleted ? theme.todoColorOn : theme.todoColorOff,
          borderRadius: BorderRadius.circular(screenSize * 0.048),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: screenSize * 0.032),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: screenSize * 0.032),
              GestureDetector(
                onTap: () => onChanged!(taskCompleted),
                child: CheckBoxMobileWidget(
                  wasCheck: taskCompleted,
                  screenSize: screenSize,
                ),
              ),
              SizedBox(width: screenSize * 0.037),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: textStyle.bodyText2,
                  ),
                  SizedBox(height: screenSize * 0.026),
                  Text(
                    '''
${month.format(todoData)} ${todoData.day}, ${todoData.year} ${todoData.hour}:${todoData.minute} $period''',
                    style: style,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
