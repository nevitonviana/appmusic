import 'package:flutter/material.dart';

import '../../core/app/music_app_colors.dart';
import 'text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const ButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: MusicAppColors.tertiaryColor),
      child: TextWidget.bold(title),
    );
  }
}
