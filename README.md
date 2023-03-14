# **BS Reusable Widgets for Flutter**

This plugin is for brainsafe reusable widgets to be used in similar future applications.
The video player plugin provides a customisable video player widget that can be used to display video content in a Flutter app. The [bs_video_player](https://pub.dev/packages/bs_video_player) package utilizes the [video_player](https://pub.dev/packages/video_player) plugin for video playback in Flutter applications. 

## Preview!
| Video Player| App Bars | Buttons |
| :--------------: | :---------------------: |:---------------------: |
| ![preview](https://user-images.githubusercontent.com/37570827/223917454-c3b0b356-179b-4aef-b862-f00d6ee12753.png) |![Simulator Screen Shot - iPhone 12 Pro - 2023-03-13 at 12 43 41](https://user-images.githubusercontent.com/37570827/224872288-85fd4b9e-3ac7-413e-9d74-3d042a78e08d.png) | ![Simulator Screen Shot - iPhone 12 Pro - 2023-03-13 at 12 45 04](https://user-images.githubusercontent.com/37570827/224872320-82e7ee7e-1b77-4e4f-bafa-b7db2b72dddf.png)|


## Installation
With Flutter:<br>
```
flutter pub add bs_reusable_widgets
```

This will add a line like this to your package's `pubspec.yaml` (and run an implicit `flutter pub get`):
```
dependencies:
  bs_reusable_widgets: ^0.3.0
```
## How to use it 
```
import 'package:bs_reusable_widgets/video_player/video_player.dart';

BSVideoPlayer(
  videoURl:
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  hasPlayBackSpeed: true,
  onFinishedVideo: () {},
)

```
