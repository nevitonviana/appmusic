import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../../../../shared/features/music_app/presentation/widgets/mini_music_player.dart';
import '../../../../shared/widgets/img_and_title_row_widget.dart';
import '../../../../shared/widgets/screen_widget.dart';
import '../../../genre_details/presentation/screens/genre_details_screen.dart';
import '../controllers/genre_list_controller.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = "/genre-list";

  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genreListCtrl = Get.find<GenreListController>();
    final musicPlayerCtrl = Get.find<MusicPlayerController>();
    return Obx(
      () {
        return ScreenWidget(
          isLoading: false,
          title: "Lista de Generos",
          error: genreListCtrl.getError,
          onTryAgain: () => genreListCtrl.getGenreList(),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      final genre = genreListCtrl.genres[index];
                      return InkWell(
                        onTap: () => Get.toNamed(
                            '${GenreListScreen.routeName}${GenreDetailsScreen.routeName}'),
                        child: ImgAndTitleRowWidget(
                          title: genre.title,
                          heroTag: genre.title,
                          img: genre.img,
                        ),
                      );
                    },
                    separatorBuilder: (__, _) => const SizedBox(height: 12),
                    itemCount: genreListCtrl.genres.length,
                  ),
                ),
              ),
              if (musicPlayerCtrl.getPlaylistPlaying.isNotEmpty)
                const MiniMusicPlayer(),
            ],
          ),
        );
      },
    );
  }
}
