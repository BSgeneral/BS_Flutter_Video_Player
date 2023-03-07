library bs_video_player;

import 'package:bs_video_player/widgets/controls_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class BSVideoPlayer extends StatefulWidget {
  final String videoURl;
  final bool hasPlayBackSpeed;
  final Function? onFinishedVideo;
  final double playbackFontSize;
  final double playbackIconSize;
  final Color iconContainerColor;
  final Color iconColor;
  final double playbackPadding;
  final Color playbackFontColor;
  final Color playbackMenuItemFontColor;
  final double playbackMenuItemFontSize;

  const BSVideoPlayer({
    super.key,
    required this.videoURl,
    required this.hasPlayBackSpeed,
    required this.onFinishedVideo,
    this.playbackFontSize = 20.0,
    this.playbackIconSize = 100.0,
    this.iconContainerColor = Colors.black26,
    this.iconColor = Colors.white,
    this.playbackPadding = 20.0,
    this.playbackFontColor = Colors.white,
    this.playbackMenuItemFontColor = Colors.black,
    this.playbackMenuItemFontSize = 20.0,
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
      color: const Color(0xFF22222B),
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
                              playbackFontSize: widget.playbackFontSize,
                              playbackIconSize: widget.playbackIconSize,
                              iconContainerColor: widget.iconContainerColor,
                              iconColor: widget.iconColor,
                              playbackPadding: widget.playbackPadding,
                              playbackFontColor: widget.playbackFontColor,
                              playbackMenuItemFontColor: widget.playbackMenuItemFontColor,
                              playbackMenuItemFontSize: widget.playbackMenuItemFontSize,
                            ),
                            VideoProgressIndicator(
                              _controller,
                              allowScrubbing: true,
                              colors: const VideoProgressColors(
                                  bufferedColor: Color(0xFFF5F5F5),
                                  playedColor: Color(0xFF253861)),
                            ),
                          ],
                        )
                      : const Center(
                          child: SpinKitCircle(color: Color(0xFF253861))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
