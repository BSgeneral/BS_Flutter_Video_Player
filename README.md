# **BS Video Player for Flutter**

This plugin provides a customisable video player widget that can be used to display video content in a Flutter app. The [bs_video_player](https://pub.dev/packages/bs_video_player) package utilizes the [video_player](https://pub.dev/packages/video_player) plugin for video playback in Flutter applications. While video_player provides direct access to video playback functions, [bs_video_player](https://pub.dev/packages/bs_video_player) wraps this functionality in an easy-to-use Material interface.

## Preview!
| Basic View | Playback speed controls |
| :--------------: | :---------------------: |
| ![preview](https://user-images.githubusercontent.com/37570827/223917454-c3b0b356-179b-4aef-b862-f00d6ee12753.png) |![preview2](https://user-images.githubusercontent.com/37570827/223918438-5276999b-2c05-4c1e-b94e-41556c13470c.png)  |


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
