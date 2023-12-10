import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/app/music_app_colors.dart';
import '../../../controllers/music_player_controller.dart';

enum PlayPauseButtonSize { small, normal }

class PlayPauseButtonWidget extends StatelessWidget {
  final String? musicUrl;
  final PlayPauseButtonSize _playPauseButtonSize;

  const PlayPauseButtonWidget(
      {super.key, this.musicUrl, PlayPauseButtonSize? playPauseButtonSize})
      : _playPauseButtonSize =
            playPauseButtonSize ?? PlayPauseButtonSize.normal;

  @override
  Widget build(BuildContext context) {
    final musicPlayerCtrl = Get.find<MusicPlayerController>();

    return Obx(
      () => IconButton(
        onPressed: () {
          if (musicUrl != null) {
            if (musicPlayerCtrl.isPlaying.value) {
              musicPlayerCtrl.pauseMusic();
            } else {
              musicPlayerCtrl.playMusic(musicUrl!);
            }
          }
        },
        iconSize: _playPauseButtonSize == PlayPauseButtonSize.normal ? 70 : 50,
        icon: Icon(
          musicPlayerCtrl.isPlaying.value
              ? Icons.pause_circle
              : Icons.play_circle,
          color: MusicAppColors.secondaryColor,
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}
