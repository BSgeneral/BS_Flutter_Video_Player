import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../data/player_constants.dart';

class PlaybackSpeedMenu extends StatelessWidget {
  final VideoPlayerController controller;
  final double playbackFontSize;
  final double playbackIconSize;
  final Color iconColor;
  final double playbackPadding;
  final Color playbackFontColor;
  final Color playbackMenuItemFontColor;
  final double playbackMenuItemFontSize;

  const PlaybackSpeedMenu({
    super.key,
    required this.controller,
    this.playbackFontSize = 10.0,
    this.playbackIconSize = 100.0,
    this.iconColor = Colors.black26,
    this.playbackPadding = 20.0,
    this.playbackFontColor = Colors.white,
    this.playbackMenuItemFontColor = Colors.black,
    this.playbackMenuItemFontSize = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(playbackPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: PopupMenuButton<double>(
          initialValue: controller.value.playbackSpeed,
          tooltip: 'Playback speed',
          onSelected: (double speed) {
            controller.setPlaybackSpeed(speed);
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<double>>[
              for (final double speed in PlayerConstants.playbackSpeeds)
                PopupMenuItem<double>(
                  value: speed,
                  child: Text(
                    '${speed}x',
                    style: TextStyle(
                        fontSize: playbackMenuItemFontSize,
                        color: playbackMenuItemFontColor),
                  ),
                )
            ];
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 16,
            ),
            child: Text('${controller.value.playbackSpeed}x',
                style: TextStyle(
                    fontSize: playbackFontSize,
                    color: playbackFontColor)),
          ),
        ),
      ),
    );
  }
}
