import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carouselsSlider extends StatefulWidget {
  const carouselsSlider({super.key});

  @override
  State<carouselsSlider> createState() => _ImagesliderState();
}

class _ImagesliderState extends State<carouselsSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (ctx, index, indx2) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "assets/Text_Generation/${index + 1}.png",
          ),
        );
      },
      options: CarouselOptions(
        viewportFraction: 1,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        enlargeCenterPage: true,
      ),
    );
  }
}
