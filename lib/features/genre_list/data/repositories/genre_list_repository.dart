import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../../../shared/models/genre_model.dart';

class GenreListRepository {
  final ApiService _apiService;

  GenreListRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, List<GenreModel>>> getGenreList() async {
    try {
      final genres = await _apiService.getGenres();

      return Right(genres);
    } on ApiException catch (apiException) {
      return Left(GetGenreListFailure(apiException.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreListFailure(generalException.message));
    }
  }
}
