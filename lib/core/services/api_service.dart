import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../shared/models/genre_detail_model.dart';
import '../../shared/models/genre_model.dart';
import '../errors/exception.dart';

class ApiService extends DioForNative {
  ApiService([super.baseOptions]);

  Future<List<GenreModel>> getGenre() async {
    try {
      const endPoint = "/genres";

      final response = await get(endPoint);
      return (response.data as List)
          .map((genre) => GenreModel.fromMap(genre))
          .toList();
    } on DioException catch (dioError, stackTrace) {
      log(
        "erro ao fazer o get dos generos musicas",
        error: dioError,
        stackTrace: stackTrace, //mostra qual linha do codigo esto o error
      );
      throw ApiException(
        message: 'Erro ao carregar generos',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error, stackTrace) {
      log(
        "erro ao fazer o get dos generos musicas",
        error: error,
        stackTrace: stackTrace, //mostra qual linha do codigo esto o error
      );
      throw GeneralException();
    }
  }

  Future<GenreDetailModel> getGenreDetails({required String genre}) async {
    try {
      final endPoint = "/genres/$genre";
      final response = await get(endPoint);

      return GenreDetailModel.fromMap(response.data);
    } on DioException catch (dioError, stackTrace) {
      log(
        "erro ao fazer o get dos detalhes generos musicas",
        error: dioError,
        stackTrace: stackTrace, //mostra qual linha do codigo esto o error
      );
      throw ApiException(
        message: 'erro ao fazer o get dos detalhes generos musicas',
        statusCode: dioError.response?.statusCode,
      );
    } catch (error, stackTrace) {
      log(
        "erro ao fazer o get dos detalhes generos musicas",
        error: error,
        stackTrace: stackTrace, //mostra qual linha do codigo esto o error
      );
      throw GeneralException();
    }
  }
}
