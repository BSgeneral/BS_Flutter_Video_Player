import 'package:bs_video_player/widgets/playback_speed_menu.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ControlsOverlay extends StatelessWidget {
  const ControlsOverlay({
    Key? key,
    required this.controller,
    required this.hasPlayBackSpeed,
    required this.finishedPlaying,
    required this.playbackTextFontSize,
    required this.playbackIconSize,
    required this.iconContainerColor,
    required this.iconColor,
    required this.playbackTextPadding,
    required this.playbackTextFontColor,
    required this.playbackMenuItemFontColor,
    required this.playbackMenuItemFontSize,
    required this.playbackTextVerticalPadding,
    required this.playbackTextHorizontalPadding,
    required this.playbackSpeeds
  }) : super(key: key);

  final VideoPlayerController controller;
  final bool hasPlayBackSpeed;
  final bool finishedPlaying;
  final double playbackTextFontSize;
  final double playbackIconSize;
  final Color iconContainerColor;
  final Color iconColor;
  final double playbackTextPadding;
  final Color playbackTextFontColor;
  final Color playbackMenuItemFontColor;
  final double playbackMenuItemFontSize;
  final double playbackTextVerticalPadding;
  final double playbackTextHorizontalPadding;
  final  List<double> playbackSpeeds;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: finishedPlaying
              ? Container(
                  color: iconContainerColor,
                  child: Center(
                    child: Icon(
                      Icons.replay,
                      color: iconColor,
                      size: playbackIconSize,
                      semanticLabel: 'Re-play',
                    ),
                  ),
                )
              : controller.value.isBuffering
                  ? Container(
                      color: iconContainerColor,
                      child: Center(
                        child: CircularProgressIndicator(color: iconColor),
                      ),
                    )
                  : controller.value.isPlaying
                      ? const SizedBox.shrink()
                      : Container(
                          color: iconContainerColor,
                          child: Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: iconColor,
                              size: playbackIconSize,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        hasPlayBackSpeed  // if we want to allow playback speed control
            ? PlaybackSpeedMenu(
                controller: controller,
                playbackTextFontSize: playbackTextFontSize, // font size for play back speed text appear on video
                iconColor: iconColor, // icon color for play, pause icons
                playbackTextPadding: playbackTextPadding, // padding for play back speed text appear on video
                playbackTextFontColor: playbackTextFontColor, // font color for play back speed text appear on video
                playbackMenuItemFontColor: playbackMenuItemFontColor, // font color for play back speed menu text
                playbackMenuItemFontSize: playbackMenuItemFontSize, // font size for play back speed menu text
                playbackTextVerticalPadding: playbackTextVerticalPadding, // vertical padding for play back speed text appear on video
                playbackTextHorizontalPadding: playbackTextHorizontalPadding, // horizontal padding for play back speed text appear on video
                playbackSpeeds: playbackSpeeds, // playback speeds to be displayed
              )
            : const SizedBox(),
      ],
    );
  }
}
