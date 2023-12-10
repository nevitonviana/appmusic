import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../../core/mixins/snack_bar_mixin.dart';
import '../../../../../core/services/audio_service/audio_play_service.dart';
import '../../../../models/music_model.dart';

class MusicPlayerController with SnackBarMixin {
  final AudioPlayService _audioPlay;

  MusicPlayerController(AudioPlayService audioPlay) : _audioPlay = audioPlay {
    _audioCompleteSubscription = _audioPlay.onAudioComplete().listen((_) {
      skipTrack();
    });
  }

  StreamSubscription? _audioCompleteSubscription;

  final RxBool isPlaying = false.obs;

  final RxInt currentMusicDuration = 0.obs;

  final RxnInt currentMusicIndexPlaying = RxnInt();

  int? get getCurrentMusicIndexPlaying => currentMusicIndexPlaying.value;

  final RxList<MusicModel> _playlistPlaying = <MusicModel>[].obs;

  List<MusicModel> get getPlaylistPlaying => _playlistPlaying;

  final List<MusicModel> selectedPlaylist = [];

  Stream<Duration> get getCurrentPositionStream =>
      _audioPlay.getPositionStream();

  Future<void> seek(int seekToDurationInSeconds) =>
      _audioPlay.seek(seekToDurationInSeconds);

  void loadPlayingList(
      List<MusicModel> newPlaylist, List<MusicModel> playlistToChange) {
    playlistToChange
      ..clear()
      ..addAll(newPlaylist);
  }

  Future<void> onCallMusicPlayerTryAndCatchFunction(
      Future<void> Function() tryFunction) async {
    try {
      await tryFunction();
    } on AudioPlayerException catch (error) {
      showErrorSnackBar(error as String);
      //rever error.message
    }
  }

  Future<void> playMusic(String url) async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = true;
      await _audioPlay.playMusic(url);
    });
  }

  Future<void> stopMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlay.stopMusic();
    });
  }

  Future<void> loadMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      loadPlayingList(selectedPlaylist, _playlistPlaying);

      await stopMusic();

      await playMusic(_playlistPlaying[getCurrentMusicIndexPlaying ?? 0].url);
    });
  }

  Future<void> pauseMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlay.pauseMusic();
    });
  }

  Future<void> skipTrack() async {
    if (getCurrentMusicIndexPlaying != null) {
      if (getCurrentMusicIndexPlaying! < _playlistPlaying.length - 1) {
        currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! + 1;
      } else {
        currentMusicIndexPlaying.value = 0;
      }
    }
    await loadMusic();
  }

  MusicModel? get getCurrentPlayingMusic {
    if (getCurrentMusicIndexPlaying != null) {
      return _playlistPlaying[getCurrentMusicIndexPlaying!];
    }
    return null;
  }

  Future<void> backTrack() async {
    if (getCurrentMusicIndexPlaying != null &&
        getCurrentMusicIndexPlaying! > 0) {
      currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! - 1;
    } else {
      currentMusicIndexPlaying.value = _playlistPlaying.length - 1;
    }
    await loadMusic();
  }

  void dispose() {
    _audioCompleteSubscription?.cancel();
  }

  Future<void> loadCurrentMusicDuration() async {
    if (!isPlaying.value) {
      currentMusicDuration.value = await _audioPlay.getCurrentPosition;
    }
  }

  void playSelectedMusic(BuildContext context, int musicIndex) {
    currentMusicIndexPlaying.value = musicIndex;

    loadMusic();

    showMusicPlayer(context);
  }

  Future<void> showMusicPlayer(BuildContext context) async {}
}
