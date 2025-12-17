import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';
import '../widgets/song_tile.dart';

class AllSongsScreen extends StatelessWidget {
  const AllSongsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();

    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 90),
      itemCount: audio.songs.length,
      itemBuilder: (context, index) {
        return SongTile(
          song: audio.songs[index],
          index: index,
        );
      },
    );
  }
}
