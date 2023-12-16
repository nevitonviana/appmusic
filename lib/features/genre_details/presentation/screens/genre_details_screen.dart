import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/features/music_app/presentation/widgets/mini_music_player.dart';
import 'package:music_app/shared/models/genre_model.dart';

import '../../../../core/app/music_app_colors.dart';
import '../widget/genre_details_app_widget.dart';
import '../widget/genre_details_music_list_widget.dart';

class GenreDetailsScreen extends StatelessWidget {
  static const routeName = "/genre-details";

  const GenreDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    final genre = Get.arguments as GenreModel;
    return Scaffold(
      backgroundColor: MusicAppColors.primaryColor,
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  GenreDetailsAppWidget(genre: genre),
                  GenreDetailsMusicListWidget(
                    genreSearchString: genre.searchString,
                  ),
                ],
              ),
            ),
            if (musicPlayerController.getPlaylistPlaying.isNotEmpty)
              const MiniMusicPlayer()
          ],
        ),
      ),
    );
  }
}
