import 'package:flutter/material.dart';

class ThemeCustom extends ThemeExtension<ThemeCustom> {
  final TextStyle? buttonTextOnStyle;
  final TextStyle? buttonTestOffStyle;
  final TextStyle? buttonError;
  final Color? buttonColorOn;
  final Color? buttonColorOff;
  final Color? notificationColorOn;
  final Color? notificationColorOff;
  final Color? buttonIconColorOn;
  final Color? buttonIconColorOff;
  final Color? mutedIcon;
  final Color? todoColorOn;
  final Color? todoColorOff;
  final TextStyle? lateStyle;
  final Color? profileButton;
  final Color? profileCardTheme;
  final Color? onlineColor;
  final Color? offColor;
  final Color? sendMsg;
  final Color? receivedMsg;
  final Color? backOpacity;
  final Color? back;
  final Color? deleted;

  ThemeCustom({
    required this.buttonTextOnStyle,
    required this.buttonTestOffStyle,
    required this.buttonColorOn,
    required this.buttonColorOff,
    required this.notificationColorOn,
    required this.notificationColorOff,
    required this.buttonIconColorOn,
    required this.buttonIconColorOff,
    required this.mutedIcon,
    required this.todoColorOn,
    required this.todoColorOff,
    required this.lateStyle,
    required this.buttonError,
    required this.profileButton,
    required this.profileCardTheme,
    required this.onlineColor,
    required this.offColor,
    required this.sendMsg,
    required this.receivedMsg,
    required this.backOpacity,
    required this.back,
    required this.deleted,
  });

  @override
  ThemeCustom copyWith([
    TextStyle? buttonTextOnStyle,
    TextStyle? buttonTestOffStyle,
    Color? buttonColorOn,
    Color? buttonColorOff,
    Color? notificationColorOn,
    Color? notificationColorOff,
    Color? buttonIconColorOn,
    Color? buttonIconColorOff,
    Color? mutedIcon,
    Color? todoColorOn,
    Color? todoColorOff,
    TextStyle? lateStyle,
    TextStyle? buttonError,
    Color? profileButton,
    Color? profileCardTheme,
    Color? onlineColor,
    Color? offColor,
    Color? sendMsg,
    Color? receivedMsg,
    Color? backOpacity,
    Color? back,
    Color? deleted,
  ]) {
    return ThemeCustom(
      buttonTextOnStyle: buttonTextOnStyle ?? this.buttonTextOnStyle,
      buttonTestOffStyle: buttonTestOffStyle ?? this.buttonTestOffStyle,
      buttonColorOn: buttonColorOn ?? this.buttonColorOn,
      buttonColorOff: buttonColorOff ?? this.buttonColorOff,
      notificationColorOn: notificationColorOn ?? this.notificationColorOn,
      notificationColorOff: notificationColorOff ?? this.notificationColorOff,
      buttonIconColorOn: buttonIconColorOn ?? this.buttonIconColorOn,
      buttonIconColorOff: buttonIconColorOff ?? this.buttonIconColorOff,
      mutedIcon: mutedIcon ?? this.mutedIcon,
      todoColorOn: todoColorOn ?? this.todoColorOn,
      todoColorOff: todoColorOff ?? this.todoColorOff,
      lateStyle: lateStyle ?? this.lateStyle,
      buttonError: buttonError ?? this.buttonError,
      back: back ?? this.back,
      backOpacity: backOpacity ?? this.backOpacity,
      deleted: deleted ?? this.deleted,
      receivedMsg: receivedMsg ?? this.receivedMsg,
      profileCardTheme: profileCardTheme ?? this.profileCardTheme,
      offColor: offColor ?? this.offColor,
      onlineColor: onlineColor ?? this.onlineColor,
      profileButton: profileButton ?? this.profileButton,
      sendMsg: sendMsg ?? this.sendMsg,
    );
  }

  @override
  ThemeCustom lerp(ThemeExtension<ThemeCustom>? other, double t) {
    if (other is! ThemeCustom) {
      return this;
    }
    return ThemeCustom(
      buttonTextOnStyle:
          TextStyle.lerp(buttonTextOnStyle, other.buttonTextOnStyle, t),
      buttonTestOffStyle:
          TextStyle.lerp(buttonTestOffStyle, other.buttonTestOffStyle, t),
      buttonColorOn: Color.lerp(buttonColorOn, other.buttonColorOn, t),
      buttonColorOff: Color.lerp(buttonColorOff, other.buttonColorOff, t),
      notificationColorOn:
          Color.lerp(notificationColorOn, other.notificationColorOn, t),
      notificationColorOff:
          Color.lerp(notificationColorOff, other.notificationColorOff, t),
      buttonIconColorOn:
          Color.lerp(buttonIconColorOn, other.buttonIconColorOn, t),
      buttonIconColorOff:
          Color.lerp(buttonIconColorOff, other.buttonIconColorOff, t),
      mutedIcon: Color.lerp(mutedIcon, other.mutedIcon, t),
      todoColorOn: Color.lerp(todoColorOn, other.todoColorOn, t),
      todoColorOff: Color.lerp(todoColorOff, other.todoColorOff, t),
      lateStyle: TextStyle.lerp(lateStyle, other.lateStyle, t),
      buttonError: TextStyle.lerp(buttonError, other.buttonError, t),
      back: Color.lerp(back, other.back, t),
      backOpacity: Color.lerp(backOpacity, other.backOpacity, t),
      deleted: Color.lerp(deleted, other.deleted, t),
      offColor: Color.lerp(offColor, other.offColor, t),
      onlineColor: Color.lerp(onlineColor, other.onlineColor, t),
      profileButton: Color.lerp(profileButton, other.profileButton, t),
      profileCardTheme: Color.lerp(profileCardTheme, other.profileCardTheme, t),
      receivedMsg: Color.lerp(receivedMsg, other.receivedMsg, t),
      sendMsg: Color.lerp(sendMsg, other.sendMsg, t),
    );
  }
}
