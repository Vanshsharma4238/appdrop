// lib/widgets/video_widget.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBlockWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  const VideoBlockWidget({super.key, required this.data});

  @override
  State<VideoBlockWidget> createState() => _VideoBlockWidgetState();
}

class _VideoBlockWidgetState extends State<VideoBlockWidget> {
  late final VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    final url = widget.data['url']?.toString() ?? '';
    if (url.isEmpty) return;

    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true;
        });
        if (widget.data['autoPlay'] == true) {
          _controller.play();
        }
      }).catchError((error) {
        debugPrint('Error initializing video: $error');
      });
    _controller.setLooping(widget.data['loop'] == true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_isInitialized) return;
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double padding = (widget.data['padding'] ?? 0).toDouble();
    final double height = (widget.data['height'] ?? 200).toDouble();

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        height: height,
        child: _isInitialized
            ? Stack(
                alignment: Alignment.center,
                children: [
                  VideoPlayer(_controller),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: _togglePlayPause,
                      child: Container(
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ),
                  ),
                  if (!_controller.value.isPlaying)
                    Center(
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 60, // Adjust size for better visibility
                        color: Colors.white, // Ensure the icon is visible
                      ),
                    ),
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
