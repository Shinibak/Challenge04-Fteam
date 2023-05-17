import 'package:flutter/material.dart';

class DateController extends ChangeNotifier {
  late DateTime dateTime;
  late DateTime reservedDate;
  bool state = true;
  late String hours = dateTime.hour.toString().padLeft(2, '0');
  late String minutes = dateTime.minute.toString().padLeft(2, '0');

  Future<DateTime?> pickDate(context) => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: reservedDate,
        lastDate: DateTime(3000),
      );

  Future<TimeOfDay?> pickTime(context) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
          hour: dateTime.hour,
          minute: dateTime.minute,
        ),
      );

  Future<void> pickDatePress(context) async {
    final time = await pickTime(context);

    if (time == null) return;

    final newDateTime = DateTime(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      time.hour,
      time.minute,
    );
    dateTime = newDateTime;
    hours = dateTime.hour.toString().padLeft(2, '0');
    minutes = dateTime.minute.toString().padLeft(2, '0');
    notifyListeners();
  }

  Future<void> pickTimePress(context) async {
    final date = await pickDate(context);
    if (date == null) return;

    final newDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      dateTime.hour,
      dateTime.minute,
    );

    dateTime = newDateTime;
    notifyListeners();
  }

  bool? validatorData() {
    late final bool _state;
    final valiDate = DateTime.now();
    if (dateTime.year == valiDate.year &&
        dateTime.month == valiDate.month &&
        dateTime.day == valiDate.day) {
      if (dateTime.hour <= valiDate.hour) {
        if (dateTime.minute <= valiDate.minute) {
          state = false;
          _state = false;
          notifyListeners();
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
}
