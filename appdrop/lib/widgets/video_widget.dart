import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBlockWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  const VideoBlockWidget({super.key, required this.data});

  @override
  State<VideoBlockWidget> createState() => _VideoBlockWidgetState();
}

class _VideoBlockWidgetState extends State<VideoBlockWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    final url = widget.data['url']?.toString() ?? '';
    if (url.isEmpty) return;

    _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..setLooping(widget.data['loop'] == true)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() => _isInitialized = true);
        if (widget.data['autoPlay'] == true) {
          _controller?.play();
        }
      }).catchError(
        // ignore: invalid_return_type_for_catch_error
        (error) => debugPrint('Error initializing video: $error'),
      );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!_isInitialized || _controller == null) return;
    setState(() {
      final controller = _controller!;
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double padding = (widget.data['padding'] ?? 0).toDouble();
    final double height = (widget.data['height'] ?? 200).toDouble();
    final double radius = (widget.data['radius'] ?? 0).toDouble();
    final url = widget.data['url']?.toString() ?? '';

    if (url.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(padding),
        child: const Text(
          'Video not available',
          style: TextStyle(color: Colors.redAccent),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: _isInitialized && _controller != null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned.fill(child: VideoPlayer(_controller!)),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                    ),
                    if (!_controller!.value.isPlaying)
                      Image.network(
                        'https://img.icons8.com/color/48/circled-play--v1.png',
                        width: 64,
                        height: 64,
                      ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
