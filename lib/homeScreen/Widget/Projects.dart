import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/homeScreen/Widget/VideoProject/Video_Controller.dart';
import 'package:video_player/video_player.dart';

final projects = {
  "Recipe_Meal": "assets/Projects/Meal.mp4",
  "jobayaa": "assets/Projects/jobayaa.mp4",
  "Skru-Calculator": "assets/Projects/Skru.mp4",
  "Expense-Tracker": "assets/Projects/Expence.mp4",
};

class allProjects extends StatefulWidget {
  const allProjects({super.key});

  @override
  State<allProjects> createState() => _allProjectsState();
}

class _allProjectsState extends State<allProjects> {
  final List<VideoPlayerController> _controllers = [];
  final Map<int, bool> _hoverStates = {};

  @override
  void initState() {
    super.initState();

    for (final videoPath in projects.values) {
      final controller = VideoPlayerController.asset(videoPath)
        ..setVolume(0.0)
        ..initialize().then((_) {
          setState(() {});
        });
      _controllers.add(controller);
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void videoController(int index, bool play) {
    setState(() {
      _hoverStates[index] = play;
      if (play) {
        _controllers[index].play();
      } else {
        _controllers[index].pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      is_Mobile = true;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hands-on Experience",
          style: (is_Mobile)
              ? Theme.of(context).textTheme.bodyMedium
              : Theme.of(context).textTheme.bodySmall,
        ),
        if (is_Mobile)
          Text(
            "Tab to preview \tDouble-Tab for cancel",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.grey.withOpacity(0.5),
                  fontSize: 30.sp,
                ),
          ),
        SizedBox(height: 20.h),
        Stack(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final projectName = projects.keys.elementAt(index);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 6,
                      child: projectPreview(
                        name: projectName,
                        VideoController: (play) =>
                            videoController(index, play == 1),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Divider(),
                    ),
                  ],
                );
              },
            ),
            for (final entry in _hoverStates.entries)
              Positioned.fill(
                child: AnimatedScale(
                  scale: entry.value ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double containerWidth = (is_Mobile)
                            ? constraints.maxWidth / 2
                            : constraints.maxWidth;
                        double containerHeight = containerWidth * (19.3 / 9);

                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            FittedBox(
                              fit: BoxFit.fill,
                              child: SizedBox(
                                width: containerWidth,
                                height: containerHeight,
                                child:
                                    _controllers[entry.key].value.isInitialized
                                        ? VideoPlayer(_controllers[entry.key])
                                        : const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                              ),
                            ),
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assets/Frames/S23U_Frame.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
