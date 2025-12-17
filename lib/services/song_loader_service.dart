import '../models/song_model.dart';

class SongLoaderService {
  static List<SongModel> loadSongs() {
    return [
      SongModel(
        title: 'Song One',
        artist: 'Unknown Artist',
        audioPath: 'assets/audio/sample_songs/song1.mp3',
        imagePath: 'assets/images/song1.png',
        genre: 'Pop',
        folder: 'Sample Songs',
        releaseDate: '2023',
      ),
      SongModel(
        title: 'Song Two',
        artist: 'Unknown Artist',
        audioPath: 'assets/audio/sample_songs/song2.mp3',
        imagePath: 'assets/images/song2.png',
        genre: 'Rock',
        folder: 'Sample Songs',
        releaseDate: '2023',
      ),
      SongModel(
        title: 'Song Three',
        artist: 'Unknown Artist',
        audioPath: 'assets/audio/sample_songs/song3.mp3',
        imagePath: 'assets/images/song3.png',
        genre: 'Jazz',
        folder: 'Sample Songs',
        releaseDate: '2023',
      ),
    ];
  }
}
