import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class customGrid extends StatelessWidget {
  const customGrid({super.key});

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      is_Mobile = true;
    }
    return SizedBox(
      height: (is_Mobile)
          ? MediaQuery.of(context).size.height / 3
          : MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: const [
              QuiltedGridTile(2, 2),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 1),
              QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) {
              return Image.asset(
                "assets/Text_Generation/ex${index + 1}.png",
                fit: BoxFit.cover,
              );
            },
            childCount: 4,
          ),
        ),
      ),
    );
  }
}
