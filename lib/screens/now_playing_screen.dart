import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/audio_provider.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final audio = context.watch<AudioProvider>();
    final song = audio.currentSong;

    if (song == null) {
      return const Scaffold(
        body: Center(child: Text('No song')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title:
        const Text('Now Playing', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                song.imagePath,
                width: 260,
                height: 260,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(song.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(song.artist,
                style: const TextStyle(color: Colors.grey)),
            Text('Release: ${song.releaseDate}',
                style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 24),

            /// SEEK BAR
            StreamBuilder<Duration>(
              stream: audio.positionStream,
              builder: (context, snapshot) {
                final position = snapshot.data ?? Duration.zero;
                return StreamBuilder<Duration?>(
                  stream: audio.durationStream,
                  builder: (context, snap) {
                    final duration =
                        snap.data ?? const Duration(seconds: 1);
                    return Column(
                      children: [
                        Slider(
                          value: position.inSeconds.toDouble(),
                          max: duration.inSeconds.toDouble(),
                          onChanged: (v) => audio.seek(
                              Duration(seconds: v.toInt())),
                          activeColor: Colors.green,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_fmt(position),
                                style: const TextStyle(color: Colors.grey)),
                            Text(_fmt(duration),
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    );
                  },
                );
              },
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    icon: const Icon(Icons.skip_previous),
                    onPressed: audio.previous),
                IconButton(
                    iconSize: 64,
                    color: Colors.green,
                    icon: Icon(audio.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle),
                    onPressed: audio.playPause),
                IconButton(
                    iconSize: 40,
                    color: Colors.white,
                    icon: const Icon(Icons.skip_next),
                    onPressed: audio.next),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _fmt(Duration d) =>
      '${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}';
}
