import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/song_model.dart';
import '../providers/audio_provider.dart';

class SongTile extends StatelessWidget {
  final SongModel song;
  final int index;

  const SongTile({
    super.key,
    required this.song,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          song.imagePath,
          width: 45,
          height: 45,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(song.title),
      subtitle: Text(song.artist),
      onTap: () {
        context.read<AudioProvider>().playSongAt(index);
      },
    );
  }
}
