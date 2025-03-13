import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/JamalScreen/Widget/Jamal_info.dart';
import 'package:video_player/video_player.dart';

class ProjectInfo extends StatefulWidget {
  const ProjectInfo({super.key});

  @override
  State<ProjectInfo> createState() => _ProjectInfoState();
}

class _ProjectInfoState extends State<ProjectInfo> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.networkUrl(
      Uri.parse("https://i.imgur.com/Ey9YLpi.mp4"),
    )
      ..setVolume(0.0)
      ..initialize().then((_) {
        setState(() {});
        _videoController.setLooping(true);
        _videoController.setPlaybackSpeed(0.3);
        _videoController.play();
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
                      child: Image.asset("assets/Intro/7.png"),
                    ),
                  ),
          ),
          Center(
            child: ListView(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height / 2),
                SizedBox(
                  height: (is_Mobile)
                      ? MediaQuery.of(context).size.height - 500.h
                      : MediaQuery.of(context).size.height - 100.h,
                  child: Column(
                    children: [
                      Text(
                        "Jamal",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        "brings your words to life.",
                        style: GoogleFonts.caveat(
                          textStyle: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  child: const jamal(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
