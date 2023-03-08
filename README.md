# **BS Video Player for Flutter**

This plugin provides a customisable video player widget that can be used to display video content in a Flutter app. The [bs_video_player](http://https://pub.dev/packages/bs_video_player "bs_video_player package") package utilizes the [video_player](http://https://pub.dev/packages/video_player "video_player") plugin for video playback in Flutter applications. While video_player provides direct access to video playback functions, [bs_video_player](http://https://pub.dev/packages/bs_video_player "bs_video_player") wraps this functionality in an easy-to-use Material interface.

## Preview!
[Uploading Simulator Screen Shot - iPhone 12 Pro - 2023-03-08 at 09.02.02.png…]()
## Installation
With Flutter:<br>
```
flutter pub add bs_video_player
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit `flutter pub get`):
```
dependencies:
  bs_video_player: ^0.1.0
```
## How to use it 
```
import 'package:bs_video_player/bs_video_player.dart';

BSVideoPlayer(
  videoURl:
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  hasPlayBackSpeed: true,
  onFinishedVideo: () {},
)

```
