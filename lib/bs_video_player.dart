library bs_video_player;

import 'package:bs_video_player/widgets/controls_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BSVideoPlayer extends StatefulWidget {
  const BSVideoPlayer({
    super.key,
    required this.videoURl,
    required this.hasPlayBackSpeed,
    required this.onFinishedVideo,
    this.playbackTextFontSize = 20.0,
    this.playbackIconSize = 100.0,
    this.iconContainerColor = Colors.black26,
    this.iconColor = Colors.white,
    this.playbackPadding = 20.0,
    this.playbackTextFontColor = Colors.white,
    this.playbackMenuItemFontColor = Colors.black,
    this.playbackMenuItemFontSize = 20.0,
    this.playbackTextVerticalPadding = 20.0,
    this.playbackTextHorizontalPadding = 16.0,
    this.containerBackgroundColor = const Color(0xFF22222B),
    this.bufferedColor = const Color(0xFFF5F5F5),
    this.progressColor = const Color(0xFF77C3EC),
    this.circleProgressIndicatorColor = const Color(0xFF253861),
    this.playbackSpeeds = const <double>[
      0.25,
      0.5,
      0.75,
      1.0,
      1.25,
      1.5,
      1.75,
      2.0
    ],
  });

  final String videoURl;
  final bool hasPlayBackSpeed;
  final Function? onFinishedVideo;
  final double playbackTextFontSize;
  final double playbackIconSize;
  final Color iconContainerColor;
  final Color iconColor;
  final double playbackPadding;
  final Color playbackTextFontColor;
  final Color playbackMenuItemFontColor;
  final double playbackMenuItemFontSize;
  final double playbackTextVerticalPadding;
  final double playbackTextHorizontalPadding;
  final Color containerBackgroundColor;
  final Color bufferedColor;
  final Color progressColor;
  final Color circleProgressIndicatorColor;
  final List<double> playbackSpeeds;

  @override
  State<BSVideoPlayer> createState() => _BSVideoPlayerState();
}

class _BSVideoPlayerState extends State<BSVideoPlayer> {
  late VideoPlayerController _controller;
  bool hasFinishedPlaying = false;

  @override
  void initState() {
    super.initState();
    // create a new VideoPlayerController to control the video playback
    _controller = VideoPlayerController.network(
      widget.videoURl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    // Add a listener to the VideoPlayerController to update the state
    // of the widget when the video playback state changes

    _controller.addListener(() {
      setState(() {});
      // Check if the video has finished playing
      if (_controller.value.duration <= _controller.value.position) {
        setState(() {
          hasFinishedPlaying = true;
          // Call the onFinishedVideo callback function if it is provided
          if (widget.onFinishedVideo != null) {
            widget.onFinishedVideo!();
          }
        });
      } else if (_controller.value.isPlaying) {
        hasFinishedPlaying = false;
      }
    });

    // Initialize the VideoPlayerController
    _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the VideoPlayerController when the widget is disposed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.containerBackgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: _controller.value.isInitialized
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller),
                            ControlsOverlay(
                              controller: _controller,
                              hasPlayBackSpeed: widget.hasPlayBackSpeed,
                              // permission to show playback speed on video screen
                              finishedPlaying: hasFinishedPlaying,
                              playbackTextFontSize: widget.playbackTextFontSize,
                              // font size for play back speed text appear on video
                              playbackIconSize: widget.playbackIconSize,
                              // play, pause icon size
                              iconContainerColor: widget.iconContainerColor,
                              // play, pause icon container size
                              iconColor: widget.iconColor,
                              // play, pause icon color
                              playbackTextPadding: widget.playbackPadding,
                              // padding for play back speed text appear on video
                              playbackTextFontColor:
                                  widget.playbackTextFontColor,
                              // font size for play back speed text appear on video
                              playbackMenuItemFontColor:
                                  widget.playbackMenuItemFontColor,
                              // font color for play back speed menu item text
                              playbackMenuItemFontSize:
                                  widget.playbackMenuItemFontSize,
                              // font size for play back speed menu item text
                              playbackTextVerticalPadding:
                                  widget.playbackTextVerticalPadding,
                              // vertical padding for play back speed text appear on video
                              playbackTextHorizontalPadding:
                                  widget.playbackTextHorizontalPadding,
                              // horizontal padding for play back speed text appear on video
                              playbackSpeeds: widget
                                  .playbackSpeeds, // playback speeds to be displayed
                            ),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                bufferedColor: widget.bufferedColor,
                                // progress indicator buffered color
                                playedColor: widget
                                    .progressColor, // progress indicator progress color
                              ),
                            ),
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(
                              color: widget.circleProgressIndicatorColor),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
