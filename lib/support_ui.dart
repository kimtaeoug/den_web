import 'package:flutter/material.dart';

class SupportUI {
  static Size? getWidget(GlobalKey key) {
    if (key.currentContext != null) {
      RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
      return renderBox.size;
    } else {
      return null;
    }
  }

  static Size getTextSize(String inputText, TextStyle inputTextStyle) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: inputText, style: inputTextStyle),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr)
      ..layout();
    return textPainter.size;
  }

}
