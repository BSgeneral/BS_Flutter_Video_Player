import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../data/player_constants.dart';

class PlaybackSpeedMenu extends StatelessWidget {
  final VideoPlayerController controller;
  final double playbackTextFontSize;
  final Color iconColor;
  final double playbackTextPadding;
  final Color playbackTextFontColor;
  final Color playbackMenuItemFontColor;
  final double playbackMenuItemFontSize;

  const PlaybackSpeedMenu({
    super.key,
    required this.controller,
    required this.playbackTextFontSize,
    required this.iconColor ,
    required this.playbackTextPadding ,
    required this.playbackTextFontColor ,
    required this.playbackMenuItemFontColor ,
    required this.playbackMenuItemFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(playbackTextPadding),
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
              vertical: 20,
              horizontal: 16,
            ),
            child: Text('${controller.value.playbackSpeed}x',
                style: TextStyle(
                    fontSize: playbackTextFontSize,
                    color: playbackTextFontColor)),
          ),
        ),
      ),
    );
  }
}
