import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

import '../../controllers/music_player_controller.dart';

class MusicPlayerMusicDuration extends StatefulWidget {
  final int duration;

  const MusicPlayerMusicDuration({super.key, required this.duration});

  @override
  State<MusicPlayerMusicDuration> createState() =>
      _MusicPlayerMusicDurationState();
}

class _MusicPlayerMusicDurationState extends State<MusicPlayerMusicDuration> {
  final sliderValuerRx = RxnDouble();

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    return StreamBuilder(
      stream: musicPlayerController.getCurrentPositionStream,
      builder: (context, AsyncSnapshot snapshot) {
        final seconds = snapshot.data?.inSeconds ??
            musicPlayerController.currentMusicDuration.value;
        return Column(
          children: [
            Obx(
              () => Slider(
                value: (sliderValuerRx.value ?? seconds / widget.duration)
                    .clamp(0.1),
                onChanged: (double sliderValue) async {
                  await musicPlayerController.seek(
                    (sliderValue * widget.duration).floor(),
                  );
                  sliderValuerRx.value = null;
                },
                activeColor: MusicAppColors.secondaryColor,
                inactiveColor: Colors.grey.shade600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget.small(seconds),
                TextWidget.small(
                  "- ${(widget.duration - seconds)}",
                ),
              ],
            )
          ],
        );
      },
    );
  }
}


