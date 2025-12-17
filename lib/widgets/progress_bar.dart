import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final Duration position;
  final Duration duration;
  final ValueChanged<Duration> onSeek;

  const ProgressBar({
    super.key,
    required this.position,
    required this.duration,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble() > 0
          ? duration.inSeconds.toDouble()
          : 1,
      onChanged: (value) {
        onSeek(Duration(seconds: value.toInt()));
      },
      activeColor: Colors.green,
      inactiveColor: Colors.grey,
    );
  }
}
