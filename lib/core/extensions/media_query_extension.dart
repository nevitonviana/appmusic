import 'package:flutter/material.dart';

extension MeidaQueryExtension on BuildContext {

  double get getHeight => MediaQuery.of(this).size.height;

  double get getWidth => MediaQuery.of(this).size.width;

  double get getTopPadding => MediaQuery.of(this).padding.top;
}
