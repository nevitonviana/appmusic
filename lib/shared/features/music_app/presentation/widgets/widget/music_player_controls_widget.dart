import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/app/music_app_colors.dart';
import '../../controllers/music_player_controller.dart';
import '../music_player_controls/widgets/play_pause_button_widget.dart';

class MusicPlayerControlsWidget extends StatelessWidget {
  final String musicPath;

  const MusicPlayerControlsWidget({super.key, required this.musicPath});

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => musicPlayerController.backTrack(),
          icon: Icon(Icons.skip_previous, color: MusicAppColors.secondaryColor),
          iconSize: 70,
          padding: const EdgeInsets.all(0),
        ),
        const SizedBox(width: 40),
        PlayPauseButtonWidget(
          musicUrl: musicPath,
        ),
        const SizedBox(width: 40),
        IconButton(
          onPressed: () => musicPlayerController.backTrack(),
          icon: Icon(Icons.skip_next, color: MusicAppColors.secondaryColor),
          iconSize: 70,
          padding: const EdgeInsets.all(0),
        )
      ],
    );
  }
}
