import 'package:just_audio/just_audio.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;

  Future<void> playFromAsset(String assetPath) async {
    await _player.setAsset(assetPath);
    _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  void seek(Duration position) {
    _player.seek(position);
  }

  void dispose() {
    _player.dispose();
  }
}
