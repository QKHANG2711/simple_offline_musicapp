import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/audio_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();

    final results = audio.songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Search song...',
            ),
            onChanged: (v) => setState(() => query = v),
          ),
        ),
        Expanded(
          child: ListView(
            children: results
                .map(
                  (song) => ListTile(
                title: Text(song.title),
                subtitle: Text(song.artist),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
