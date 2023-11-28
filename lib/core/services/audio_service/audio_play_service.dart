abstract class AudioPlayService {
  Stream<Duration> getPositionStream();

  Future<int> get getCurrentPosition;

  Future<void> playMusic(String audioUrl);

  Future<void> pauseMusic();

  Future<void> resumeMusic();

  Future<void> stopMusic();

  Stream<void> onAudioComplete();

  Future<void> seek(int seconds);
}
