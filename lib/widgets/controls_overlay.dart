import 'package:bs_video_player/widgets/playback_speed_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                        child: SpinKitCircle(color: iconColor),
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
        hasPlayBackSpeed
            ? PlaybackSpeedMenu(
                controller: controller,
                playbackTextFontSize: playbackTextFontSize,
                iconColor: iconColor,
                playbackTextPadding: playbackTextPadding,
                playbackTextFontColor: playbackTextFontColor,
                playbackMenuItemFontColor: playbackMenuItemFontColor,
                playbackMenuItemFontSize: playbackMenuItemFontSize,
              )
            : const SizedBox(),
      ],
    );
  }
}
