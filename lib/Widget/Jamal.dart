import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hamdy/Widget/customGrid_Info.dart';

class jamal extends StatelessWidget {
  const jamal({super.key});

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      is_Mobile = true;
    }
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            "From everyday scenes to wild fantasies, Jamal captures it all. No idea is too big or too small—his work is as diverse as your creativity.",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 42.sp,
                ),
          ),
        ),
        const customGrid(),
        if (!is_Mobile) SizedBox(height: 70.h),
        SizedBox(
          height: (is_Mobile)
              ? MediaQuery.of(context).size.height / 4
              : MediaQuery.of(context).size.height,
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Text(
                    "Jamal's genius comes from advanced AI trained on high-quality datasets, allowing him to create images that feel real. Every piece of art is carefully crafted to match your vision.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 48.sp,
                        ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: (is_Mobile)
                    ? MediaQuery.of(context).size.width / 2.5
                    : MediaQuery.of(context).size.width / 2.87,
                height: (is_Mobile)
                    ? MediaQuery.of(context).size.width / 2.5
                    : MediaQuery.of(context).size.height / 1.5,
                child: Image.asset(
                  "assets/Text_Generation/ex5.png",
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 70.h),
        SizedBox(
          height: (is_Mobile)
              ? MediaQuery.of(context).size.height / 4
              : MediaQuery.of(context).size.height,
          child: Row(
            children: [
              SizedBox(
                width: (is_Mobile)
                    ? MediaQuery.of(context).size.width / 2.5
                    : MediaQuery.of(context).size.width / 2.87,
                height: (is_Mobile)
                    ? MediaQuery.of(context).size.width / 2.5
                    : MediaQuery.of(context).size.height / 1.5,
                child: Image.asset(
                  "assets/Text_Generation/ex7.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: Text(
                    "Jamal’s art is waiting to inspire. Share his creations and let his boundless creativity spark your imagination.",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 48.sp,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 150.h),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width / 1.5,
        //   height: MediaQuery.of(context).size.height / 1.5,
        //   child: Image.asset(
        //     "assets/Text_Generation/ex6.png",
        //     fit: BoxFit.fill,
        //   ),
        // ),
        // SizedBox(height: 50.h),
      ],
    );
  }
}
