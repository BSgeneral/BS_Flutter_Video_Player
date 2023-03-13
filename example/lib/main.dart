import 'package:bs_reusable_widgets/buttons/rounded_button_with_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'feature/app_bars.dart';
import 'feature/video_player.dart';

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
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RoundedBorderButton(
                btnTitle: 'See App Bars',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppBars()),
                  );
                },
                bgColor: const Color(0xFF253861),
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedBorderButton(
                btnTitle: 'See Video Player',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideoPlayer()),
                  );
                },
                bgColor: const Color(0xFF253861),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
