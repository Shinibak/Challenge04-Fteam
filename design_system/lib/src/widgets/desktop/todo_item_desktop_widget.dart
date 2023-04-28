import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'check_box_desktop_widget.dart';

// ignore: must_be_immutable
class TodoItemDesktopWidget extends StatelessWidget {
  final String taskName;
  final String date;
  final double screenSize;
  final bool taskCompleted;
  Function(bool)? onChanged;
  Function(BuildContext)? deletedFunction;
  final bool validate;

  TodoItemDesktopWidget({
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
            borderRadius: BorderRadius.circular(20),
          ),
        ],
      ),
      child: Container(
        height: screenSize * 0.06640625,
        width: screenSize * 0.234375,
        decoration: BoxDecoration(
          color: taskCompleted ? theme.todoColorOn : theme.todoColorOff,
          borderRadius: BorderRadius.circular(screenSize * 0.017578125),
        ),
        child: Row(
          children: [
            SizedBox(width: screenSize * 0.013671875),
            GestureDetector(
              onTap: () => onChanged!(taskCompleted),
              child: CheckBoxDesktopWidget(
                wasCheck: taskCompleted,
                screenSize: screenSize,
              ),
            ),
            SizedBox(width: screenSize * 0.01171875),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  taskName.length > 15
                      ? '${taskName.substring(1, 15)}...'
                      : taskName,
                  style: textStyle.bodyText2,
                ),
                SizedBox(height: screenSize * 0.0078125),
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
    );
  }
}
