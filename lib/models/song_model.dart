class SongModel {
  final String title;
  final String artist;
  final String audioPath; // 🔥 BẮT BUỘC
  final String imagePath;
  final String genre;
  final String folder;
  final String releaseDate;

  SongModel({
    required this.title,
    required this.artist,
    required this.audioPath,
    required this.imagePath,
    required this.genre,
    required this.folder,
    required this.releaseDate,
  });
}
