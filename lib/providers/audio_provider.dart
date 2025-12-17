import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import '../models/song_model.dart';
import '../utils/constants.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  List<SongModel> songs = [];
  int _currentIndex = -1;

  SongModel? get currentSong =>
      (_currentIndex >= 0 && _currentIndex < songs.length)
          ? songs[_currentIndex]
          : null;

  bool get isPlaying => _player.playing;

  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;

  /// ✅ THÊM HÀM NÀY
  void loadSongs() {
    songs = demoSongs; // lấy từ constants.dart
    notifyListeners();
  }

  Future<void> playSongAt(int index) async {
    if (index < 0 || index >= songs.length) return;

    _currentIndex = index;

    await _player.setAsset(songs[index].audioPath);
    _player.play();

    notifyListeners();
  }

  void playPause() {
    _player.playing ? _player.pause() : _player.play();
    notifyListeners();
  }

  void next() {
    if (_currentIndex < songs.length - 1) {
      playSongAt(_currentIndex + 1);
    }
  }

  void previous() {
    if (_currentIndex > 0) {
      playSongAt(_currentIndex - 1);
    }
  }

  void seek(Duration position) {
    _player.seek(position);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}
