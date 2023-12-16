import 'package:get/get.dart';
import 'package:music_app/shared/models/music_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../../../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../../../../shared/models/genre_detail_model.dart';
import '../../../../shared/models/genre_model.dart';
import '../../data/repositories/genre_details_repository.dart';

class GenreDetailsController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreDetailsRepository _genreDetailsRepository;
  final MusicPlayerController _musicPlayerController;

  GenreDetailsController(
      {required GenreDetailsRepository genreDetailsRepository,
      required MusicPlayerController musicPlayerController})
      : _genreDetailsRepository = genreDetailsRepository,
        _musicPlayerController = musicPlayerController;

  GenreDetailModel? genreDetail;

  @override
  void onInit() {
    final genre = Get.arguments as GenreModel;
    loadGenreDetails(genre.searchString);
    super.onInit();
  }

  Future<void> loadGenreDetails(String genre) async {
    setLoadingToTrue();
    setError(null);
    final genreDetailsResponseEither =
        await _genreDetailsRepository.getGenreDetails(genre);

    genreDetailsResponseEither.fold((Failure failureResponse) {
      if (failureResponse is GetGenreDetailFailure) {
        setError(failureResponse.message);
      }
    }, (GenreDetailModel genreDetailsResponse) {
      genreDetail = genreDetailsResponse;

      _musicPlayerController.loadPlayingList(
          genreDetailsResponse.musics, _musicPlayerController.selectedPlaylist);
    });

    setLoadingToFalse();

    MusicModel? getMusicByIndex(int index) => genreDetail?.musics[index];

    // List<MusicModel>? get getMusic => genreDetail?.musics;
    List<MusicModel>? getMusic = genreDetail?.musics;
  }
}
