import 'package:bs_reusable_widgets/app_bars/step_progress_app_bar.dart';
import 'package:bs_reusable_widgets/video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      body: Column(
        children: [
          BSVideoPlayer(
            videoURl:
                'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
            hasPlayBackSpeed: true,
            onFinishedVideo: () {},
          ),
          const StepProgressAppBar(
              title: 'title',
              subTitle: 'subTitle',
              totalSteps: 3,
              currentStep: 1,
              progressText: 'progress'),
        ],
      ),
    );
  }
}
