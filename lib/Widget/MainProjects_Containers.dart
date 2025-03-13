import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdy/Screen/info.dart';
import 'package:hamdy/Widget/GenerationImage_Viewer.dart';
import 'package:hamdy/Widget/Video_Preview.dart';

class mainProjects extends StatelessWidget {
  const mainProjects({super.key});

  @override
  Widget build(BuildContext context) {
    double Curr_hight = MediaQuery.of(context).size.height / 1.6;
    bool Is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      //Mobile
      Is_Mobile = true;
      Curr_hight = MediaQuery.of(context).size.height / 4;
    }
    List<Widget> Mainprojects = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const ProjectInfo(),
                ),
              );
            },
            child: Container(
              width: (Is_Mobile)
                  ? MediaQuery.of(context).size.width
                  : MediaQuery.of(context).size.width / 2,
              height: Curr_hight,
              padding: EdgeInsets.symmetric(vertical: 30.h),
              decoration: BoxDecoration(
                color: const Color(0xFFbca0d4),
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: const carouselsSlider(),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "Text To Image Generation Model",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
      const Spacer(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (Is_Mobile)
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width / 3,
            height: Curr_hight,
            padding: EdgeInsets.symmetric(vertical: (Is_Mobile) ? 20.h : 70.h),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF7d7484),
              borderRadius: BorderRadius.circular(30),
            ),
            child:
                const videoPreview(VideoName: "assets/Projects/CineMagic.mp4"),
          ),
          SizedBox(height: 20.h),
          Text(
            "CineMagic App",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey,
                ),
          ),
        ],
      ),
    ];
    return (Is_Mobile)
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: Mainprojects,
            ),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: Mainprojects,
          );
  }
}
