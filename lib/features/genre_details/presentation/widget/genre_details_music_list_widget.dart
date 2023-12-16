import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../../../../shared/widgets/app_music_error_widget.dart';
import '../../../../shared/widgets/circular_progress_indicator_widget.dart';
import '../../../../shared/widgets/text_widget.dart';
import '../controllers/genre_details_controller.dart';

class GenreDetailsMusicListWidget extends StatelessWidget {
  final String genreSearchString;

  const GenreDetailsMusicListWidget(
      {super.key, required this.genreSearchString});

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
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
