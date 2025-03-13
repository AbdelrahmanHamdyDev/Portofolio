import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class header extends StatelessWidget {
  const header({super.key});

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    double Curr_height = MediaQuery.of(context).size.height - 100.h;
    final Curr_width = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      //Mobile
      is_Mobile = true;
      Curr_height = MediaQuery.of(context).size.height / 2.5;
    }

    List<Widget> info = [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.work,
            color: Colors.grey,
          ),
          SizedBox(height: 10.h),
          Text(
            "Recent Experience",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 10.h),
          Text(
            "Fresh Graduate",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      SizedBox(width: 200.w, height: (is_Mobile) ? 20.h : 0),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          SizedBox(height: 10.h),
          Text(
            "Location",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 10.h),
          Text(
            "Cairo,Egypt",
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    ];

    return SizedBox(
      height: Curr_height,
      width: Curr_width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "I enjoy creating",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            children: [
              Text(
                "Mobile",
                style: GoogleFonts.caveat(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 180.sp),
                ),
              ),
              Text(
                " Products.",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const Spacer(),
          if (is_Mobile)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: info,
            ),
          if (!is_Mobile)
            Row(
              children: info,
            ),
          if (is_Mobile) const Spacer()
        ],
      ),
    );
  }
}
