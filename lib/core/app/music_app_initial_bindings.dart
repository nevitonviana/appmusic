import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../shared/features/music_app/presentation/controllers/music_player_controller.dart';
import '../services/api_service.dart';
import '../services/audio_service/audio_player_service_impl.dart';
import '../services/dot_env_service.dart';

class MusicAppInitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ApiService(
        BaseOptions(
          baseUrl:
              "https://my-json-server.typicode.com/nevitonviana/api/genres",
          //DotEnvService.getApiBaseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(
            seconds: 10,
          ),
        ),
      ),
    );
    Get.put(AudioPlayerServiceImpl(AudioPlayer()));

    Get.lazyPut(() => MusicPlayerController(AudioPlayerServiceImpl(AudioPlayer())));
  }
}
