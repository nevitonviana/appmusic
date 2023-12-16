import 'package:flutter/material.dart';

import '../../core/app/music_app_colors.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: MusicAppColors.secondaryColor,
      ),
    );
  }
}
