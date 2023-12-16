import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../../core/app/music_app_colors.dart';
import '../../../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../../../../shared/models/music_model.dart';
import '../../../../shared/widgets/app_music_error_widget.dart';
import '../../../../shared/widgets/circular_progress_indicator_widget.dart';
import '../../../../shared/widgets/img_and_title_row_widget.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../controllers/genre_details_controller.dart';

class GenreDetailsMusicListWidget extends StatelessWidget {
  final String genreSearchString;

  const GenreDetailsMusicListWidget(
      {super.key, required this.genreSearchString});

  Color _getMusicTitleColor(
      MusicModel currentMusicInList, MusicModel? currentPlaying) {
    if (currentMusicInList.title == currentPlaying?.title) {
      return MusicAppColors.tertiaryColor;
    }
    return MusicAppColors.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final genreDetailsController = Get.find<GenreDetailsController>();
    final musicPlayerController = Get.find<MusicPlayerController>();
    return Obx(
      () => SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 8),
            if (genreDetailsController.getIsLoading)
              const CircularProgressIndicatorWidget(),
            if (!genreDetailsController.getIsLoading &&
                genreDetailsController.getError != null)
              AppMusicErrorWidget(
                error: genreDetailsController.getError.toString(),
                onTryAgain: () =>
                    genreDetailsController.loadGenreDetails(genreSearchString),
              ),
            if (!genreDetailsController.getIsLoading &&
                genreDetailsController.getError == null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.title("Musicas"),
                    ...genreDetailsController.genreDetail?.musics
                            .asMap()
                            .map(
                              (int index, MusicModel music) => MapEntry(
                                index,
                                Builder(
                                  builder: (context) => Column(
                                    children: [
                                      InkWell(
                                        onTap: () => musicPlayerController
                                            .playSelectedMusic(context, index),
                                        child: ImgAndTitleRowWidget(
                                            title: music.title,
                                            heroTag: index.toString(),
                                            img: music.img,
                                            titleColor: _getMusicTitleColor(
                                                music,
                                                musicPlayerController
                                                    .getCurrentPlayingMusic)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList() ??
                        [],
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
