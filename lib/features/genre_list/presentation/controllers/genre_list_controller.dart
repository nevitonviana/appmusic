// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../../../../shared/models/genre_model.dart';
import '../../data/repositories/genre_list_repository.dart';

class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  final RxList<GenreModel> genres = RxList([]);

  // ignore: unnecessary_overrides
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getGenreList() async {
    setLoadingToTrue();
    setError(null);
    final getGenreResponse = await _genreListRepository.getGenreList();
    getGenreResponse.fold(
      (Failure failureResponse) {
        if (failureResponse is GetGenreListFailure) {
          setError(failureResponse.message);
        }
      },
      (List<GenreModel> genreResponse) {
        genres.value = genreResponse;
      },
    );
    setLoadingToFalse();
  }
}
