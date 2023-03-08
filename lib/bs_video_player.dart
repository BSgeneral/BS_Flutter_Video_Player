library bs_video_player;

import 'package:bs_video_player/widgets/controls_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class BSVideoPlayer extends StatefulWidget {
  final String videoURl;
  final bool hasPlayBackSpeed;
  final Function? onFinishedVideo;
  final double playbackTextFontSize;
  final double playbackTextIconSize;
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
  final Color spinKitCircleColor;

  const BSVideoPlayer({
    super.key,
    required this.videoURl,
    required this.hasPlayBackSpeed,
    required this.onFinishedVideo,
    this.playbackTextFontSize = 20.0,
    this.playbackTextIconSize = 100.0,
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
    this.progressColor = const Color(0xFF253861),
    this.spinKitCircleColor = const  Color(0xFF253861),
  });

  @override
  State<BSVideoPlayer> createState() => _BSVideoPlayerState();
}

class _BSVideoPlayerState extends State<BSVideoPlayer> {
  late VideoPlayerController _controller;
  bool hasFinishedPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoURl,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
      if (_controller.value.duration <= _controller.value.position) {
        setState(() {
          hasFinishedPlaying = true;
          if (widget.onFinishedVideo != null) {
            widget.onFinishedVideo!();
          }
        });
      } else if (_controller.value.isPlaying) {
        hasFinishedPlaying = false;
      }
    });

    _controller.initialize();
  }

  @override
  void dispose() {
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
                              finishedPlaying: hasFinishedPlaying,
                              playbackTextFontSize: widget.playbackTextFontSize,
                              playbackIconSize: widget.playbackTextIconSize,
                              iconContainerColor: widget.iconContainerColor,
                              iconColor: widget.iconColor,
                              playbackTextPadding: widget.playbackPadding,
                              playbackTextFontColor: widget.playbackTextFontColor,
                              playbackMenuItemFontColor: widget.playbackMenuItemFontColor,
                              playbackMenuItemFontSize: widget.playbackMenuItemFontSize,
                              playbackTextVerticalPadding: widget.playbackTextVerticalPadding,
                              playbackTextHorizontalPadding: widget.playbackTextHorizontalPadding,
                            ),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: VideoProgressColors(
                                  bufferedColor: widget.bufferedColor,
                                  playedColor: widget.progressColor ),
                            ),
                          ],
                        )
                      :  Center(
                          child: SpinKitCircle(color:widget.spinKitCircleColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
