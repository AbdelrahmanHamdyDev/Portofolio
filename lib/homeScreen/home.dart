import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/homeScreen/Widget/headlight_projects/headLight_ProjectsContainer.dart';
import 'package:portfolio/homeScreen/Widget/Projects.dart';
import 'package:portfolio/homeScreen/Widget/header.dart';
import 'package:video_player/video_player.dart';

class HamdyHome extends StatefulWidget {
  const HamdyHome({super.key});

  @override
  State<HamdyHome> createState() => _HamdyHomeState();
}

class _HamdyHomeState extends State<HamdyHome> {
  late VideoPlayerController _videoController;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse("https://i.imgur.com/fHp8UuD.mp4"),
    )
      ..setVolume(0.0)
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.play();
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            _opacity = 1.0;
          });
        });
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      is_Mobile = true;
    }
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: _videoController.value.isInitialized
                ? FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoController.value.size.width,
                      height: _videoController.value.size.height,
                      child: VideoPlayer(_videoController),
                    ),
                  )
                : FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: _videoController.value.size.width,
                      height: _videoController.value.size.height,
                      child: Image.asset("assets/Intro/5.png"),
                    ),
                  ),
          ),
          AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 1),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 100.w),
              child: ListView(
                children: [
                  const header(),
                  SizedBox(height: 50.sp),
                  const mainProjects(),
                  SizedBox(height: 150.sp),
                  if (is_Mobile)
                    Column(
                      children: [
                        const Divider(),
                        SizedBox(height: 50.sp),
                      ],
                    ),
                  const allProjects(),
                  SizedBox(height: 50.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
