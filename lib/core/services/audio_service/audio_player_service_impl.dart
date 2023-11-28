import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../../errors/exception.dart';
import 'audio_play_service.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();
      return position?.inSeconds ?? 0;
    } catch (error, stackTrace) {
      log("Erro ao pager posição de musica",
          error: error, stackTrace: stackTrace);
      throw PlayerException(message: "Erro ao pegar posicao da musica");
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusic() async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.pause(), "Erro ao pegar pausa da musica");
  }

  @override
  Future<void> playMusic(String audioAsset) async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.play(
              AssetSource(audioAsset),
            ),
        "Erro ao pegar play da musica");
  }

  Future<void> callAudioPlayerServiceTryAndCatchFunction(
      Future<void> Function() treyFunction,
      String audioPlayExceptionMessage) async {
    try {
      await treyFunction();
    } catch (error, stackTrace) {
      log(audioPlayExceptionMessage, error: error, stackTrace: stackTrace);
      throw PlayerException(message: audioPlayExceptionMessage);
    }
  }

  @override
  Future<void> resumeMusic() async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.resume(), "Erro ao pegar resume da musica");
  }

  @override
  Future<void> seek(int seconds) async {
    callAudioPlayerServiceTryAndCatchFunction(() {
      final seekTo = Duration(seconds: seconds);
      return audioPlayer.seek(seekTo);
    }, "Erro ao pegar duração da musica");
  }

  @override
  Future<void> stopMusic() async {
    return callAudioPlayerServiceTryAndCatchFunction(
        () => audioPlayer.stop(), "Erro ao pegar parar a musica");
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
