import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoPreview extends StatefulWidget {
  const videoPreview({super.key, required this.VideoName});

  final String VideoName;

  @override
  State<videoPreview> createState() => _videoPreviewState();
}

class _videoPreviewState extends State<videoPreview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.VideoName)
      ..setVolume(0.0)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        _controller.seekTo(Duration.zero);
      }
    });
    _controller.play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const CircularProgressIndicator(),
    );
  }
}
