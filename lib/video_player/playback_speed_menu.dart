import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlaybackSpeedMenu extends StatelessWidget {
  const PlaybackSpeedMenu({
    super.key,
    required this.controller,
    required this.playbackTextFontSize,
    required this.iconColor,
    required this.playbackTextPadding,
    required this.playbackTextFontColor,
    required this.playbackMenuItemFontColor,
    required this.playbackMenuItemFontSize,
    required this.playbackTextVerticalPadding,
    required this.playbackTextHorizontalPadding,
    required this.playbackSpeeds,
  });

  final VideoPlayerController controller;
  final double
      playbackTextFontSize; // font size for play back speed text appear on video
  final Color iconColor; // icon color for play, pause icons
  final double
      playbackTextPadding; // padding for play back speed text appear on video
  final Color
      playbackTextFontColor; // font color for play back speed text appear on video
  final Color
      playbackMenuItemFontColor; // font color for play back speed menu text
  final double
      playbackMenuItemFontSize; // font size for play back speed menu text
  final double
      playbackTextVerticalPadding; // vertical padding for play back speed text appear on video
  final double
      playbackTextHorizontalPadding; // horizontal padding for play back speed text appear on video
  final List<double>
      playbackSpeeds; // playback speeds to be displayed in the menu

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(playbackTextPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: PopupMenuButton<double>(
          initialValue: controller.value.playbackSpeed,
          // set the current playback speed as the initial value for the menu
          tooltip: 'Playback speed',
          // tooltip for the menu button
          onSelected: (double speed) {
            // when a playback speed menu item is selected
            controller
                .setPlaybackSpeed(speed); // set the selected playback speed
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuItem<double>>[
              // create a playback speed menu item for each value in playbackSpeeds list
              for (final double speed in playbackSpeeds)
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
            padding: EdgeInsets.symmetric(
              //padding for playback speed appear on video
              vertical: playbackTextVerticalPadding,
              horizontal: playbackTextHorizontalPadding,
            ),
            child: Text('${controller.value.playbackSpeed}x',
                // display the current playback speed
                style: TextStyle(
                    fontSize: playbackTextFontSize,
                    color: playbackTextFontColor)),
          ),
        ),
      ),
    );
  }
}
