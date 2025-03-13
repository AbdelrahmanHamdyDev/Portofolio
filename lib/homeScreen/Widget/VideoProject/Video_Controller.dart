import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class projectPreview extends StatefulWidget {
  const projectPreview({
    super.key,
    required this.name,
    required this.VideoController,
  });

  final String name;
  final Function(int) VideoController;

  @override
  State<projectPreview> createState() => _projectPreviewState();
}

class _projectPreviewState extends State<projectPreview> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    bool is_Mobile = false;
    if (MediaQuery.of(context).size.height >
        MediaQuery.of(context).size.width) {
      is_Mobile = true;
    }
    final mainContent_Widget = Container(
      decoration: BoxDecoration(
        color: (_isHovered) ? Colors.grey.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            widget.name,
            style: GoogleFonts.caveat(
              textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 70.sp,
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ),
        ),
      ),
    );
    return (is_Mobile)
        ? InkWell(
            onTap: () {
              setState(() {
                widget.VideoController(1);
                _isHovered = true;
              });
            },
            onDoubleTap: () {
              setState(() {
                widget.VideoController(0);
                _isHovered = false;
              });
            },
            child: mainContent_Widget,
          )
        : MouseRegion(
            onEnter: (_) {
              setState(() {
                widget.VideoController(1);
                _isHovered = true;
              });
            },
            onExit: (_) {
              setState(() {
                widget.VideoController(0);
                _isHovered = false;
              });
            },
            child: mainContent_Widget,
          );
  }
}
