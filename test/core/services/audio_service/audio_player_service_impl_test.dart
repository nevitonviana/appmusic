import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:music_app/core/services/audio_service/audio_player_service_impl.dart';

class MockAudioPlayer extends Mock implements AudioPlayer {}

void main() {
  late MockAudioPlayer mockAudioPlayer;
  late AudioPlayerServiceImpl audioPlayerService;

  setUp(() {
    mockAudioPlayer = MockAudioPlayer();
    audioPlayerService = AudioPlayerServiceImpl(mockAudioPlayer);
  });

  test("should get current musci position", () async {
    when(() => mockAudioPlayer.getCurrentPosition())
        .thenAnswer((_) => Future.value(const Duration(seconds: 10)));

    final position = await audioPlayerService.getCurrentPosition;

    verify(() => mockAudioPlayer.getCurrentPosition()).called(1);
    expect(position, equals(10));
  });

  test(
    "should get audio complite stream",
    () {
      final mockStreamCltrl = StreamController<Duration>();

      when(() => mockAudioPlayer.onPositionChanged)
          .thenAnswer((_) => mockStreamCltrl.stream);

      final positionSream = audioPlayerService.getPositionStream();

      verify(() => mockAudioPlayer.onPositionChanged).called(1);

      expect(positionSream, equals(mockStreamCltrl.stream));
    },
  );

  group("pause music", () {
    test("should succssfully", () async {
      when(
        () => mockAudioPlayer.pause(),
      ).thenAnswer((_) => Future.value());

      await audioPlayerService.pauseMusic();

      verify(() => mockAudioPlayer.pause()).called(1);
    });

    test("should fail on pause music", () {
      when(() => mockAudioPlayer.pause()).thenThrow(Exception());

      final futurePause = audioPlayerService.pauseMusic();

      verify(() => mockAudioPlayer.pause()).called(1);
      expect(futurePause, throwsA(isA<Exception>()));
    });
  });
}
