import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();

    final folders = audio.songs
        .map((s) => s.folder)
        .toSet()
        .toList();

    return ListView(
      children: folders
          .map(
            (folder) => ListTile(
          leading: const Icon(Icons.folder),
          title: Text(folder),
        ),
      )
          .toList(),
    );
  }
}
