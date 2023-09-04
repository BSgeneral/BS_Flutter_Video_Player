import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:video_player/video_player.dart';

class BrainSafeVideoPlayer extends StatefulWidget {
  final VideoPlayerController videoController;
  final bool hasPlayBackSpeed;
  final Function? onFinishedVideo;

  const BrainSafeVideoPlayer(
      {super.key,
      required this.videoController,
      required this.hasPlayBackSpeed,
      this.onFinishedVideo});

  @override
  _BrainSafeVideoPlayerState createState() => _BrainSafeVideoPlayerState();
}

class _BrainSafeVideoPlayerState extends State<BrainSafeVideoPlayer> {
  bool hasFinishedPlaying = false;

  @override
  void initState() {
    super.initState();

    widget.videoController.addListener(() {
      setState(() {});
      if (widget.videoController.value.duration <=
          widget.videoController.value.position) {
        setState(() {
          hasFinishedPlaying = true;
          if (widget.onFinishedVideo != null) {
            widget.onFinishedVideo!();
          }
        });
      } else if (widget.videoController.value.isPlaying) {
        hasFinishedPlaying = false;
      }
    });

    widget.videoController.initialize();
  }

  @override
  void dispose() {
    widget.videoController.dispose();
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
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: AspectRatio(
                  aspectRatio: widget.videoController.value.aspectRatio,
                  child: widget.videoController.value.isInitialized
                      ? Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(widget.videoController),
                            _ControlsOverlay(
                                controller: widget.videoController,
                                hasPlayBackSpeed: widget.hasPlayBackSpeed,
                                finishedPlaying: hasFinishedPlaying),
                            VideoProgressIndicator(
                              widget.videoController,
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

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay(
      {Key? key,
      required this.controller,
      required this.hasPlayBackSpeed,
      required this.finishedPlaying})
      : super(key: key);

  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    0.75,
    1.0,
    1.25,
    1.5,
    1.75,
    2.0,
  ];

  final VideoPlayerController controller;
  final bool hasPlayBackSpeed;
  final bool finishedPlaying;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
    );
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: finishedPlaying
              ? Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.replay,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'RePlay',
                    ),
                  ),
                )
              : controller.value.isBuffering
                  ? Container(
                      color: Colors.black26,
                      child: const Center(
                        child: SpinKitCircle(color: Color(0xFFFFFFFF)),
                      ),
                    )
                  : controller.value.isPlaying
                      ? const SizedBox.shrink()
                      : Container(
                          color: Colors.black26,
                          child: const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 100.0,
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
            ? Container(
                padding: EdgeInsets.all(10.w),
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
                        for (final double speed in _examplePlaybackRates)
                          PopupMenuItem<double>(
                            value: speed,
                            child: Text('${speed}x'),
                          )
                      ];
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        // Using less vertical padding as the text is also longer
                        // horizontally, so it feels like it would need more spacing
                        // horizontally (matching the aspect ratio of the video).
                        vertical: 12,
                        horizontal: 16,
                      ),
                      child: Text('${controller.value.playbackSpeed}x',
                          style: const TextStyle(
                              fontSize: 18.0, color: Colors.white)),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
