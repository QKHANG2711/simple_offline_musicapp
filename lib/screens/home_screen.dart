import 'package:flutter/material.dart';
import '../widgets/mini_player.dart';
import 'all_songs_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Offline Music')),
      body: Stack(
        children: const [
          AllSongsScreen(),
          Align(
            alignment: Alignment.bottomCenter,
            child: MiniPlayer(),
          ),
        ],
      ),
    );
  }
}
