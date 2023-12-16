import 'dart:developer';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/services/api_service.dart';
import '../../../../shared/models/genre_detail_model.dart';

class GenreDetailsRepository {
  final ApiService _apiService;

  GenreDetailsRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, GenreDetailModel>> getGenreDetails(
      String genre) async {
    try {
      final genreDetails = await _apiService.getGenreDetails(genre: genre);

      return Right(genreDetails);
    } on ApiException catch (apiException) {
      log("", error: apiException.message);
      return Left(GetGenreDetailFailure(apiException.message));
    } on GeneralException catch (genreException) {
      log(genre.toString());
      return Left(GetGenreDetailFailure(genreException.message));
    }
  }
}
