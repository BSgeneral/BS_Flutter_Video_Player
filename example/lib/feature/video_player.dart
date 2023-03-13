import 'package:bs_reusable_widgets/video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BSVideoPlayer(
        videoURl:
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        hasPlayBackSpeed: true,
        onFinishedVideo: () {},
      ),
    );
  }
}
