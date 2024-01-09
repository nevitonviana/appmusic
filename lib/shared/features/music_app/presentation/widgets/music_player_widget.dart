import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../../core/app/music_app_colors.dart';
import '../../../../models/music_model.dart';
import 'widget/music_player_controls_widget.dart';
import 'widget/music_player_music_duration.dart';

class MusicPlayerWidget extends StatelessWidget {
  final MusicModel music;

  const MusicPlayerWidget({super.key, required this.music});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 25,
        sigmaY: 25,
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(Icons.arrow_downward_outlined,
                      color: MusicAppColors.secondaryColor),
                ),
                MusicPlayerWidget(music: music),
                const SizedBox(height: 24),
                MusicPlayerMusicDuration(duration: music.duration),
                MusicPlayerControlsWidget(musicPath: music.url,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
