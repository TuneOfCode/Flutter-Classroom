import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final double aspectRatio;
  final bool isVideoProgressIndicator;

  const VideoPlayerWidget({
    super.key,
    this.url =
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    this.aspectRatio = 1.0,
    this.isVideoProgressIndicator = false,
  });

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = widget.url.contains('http') || widget.url.contains('https')
        ? VideoPlayerController.networkUrl(Uri.parse(widget.url))
        : VideoPlayerController.asset(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize().then((_) {
      _controller.play();
      _controller.setLooping(true);
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: InkWell(
                    child: AspectRatio(
                      aspectRatio: widget.aspectRatio == 1.0
                          ? _controller.value.aspectRatio
                          : widget.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    onTap: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      });
                    },
                  ),
                ),
              ),
              if (widget.isVideoProgressIndicator) ...[
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: VideoProgressIndicator(
                    _controller,
                    allowScrubbing: true,
                    colors: const VideoProgressColors(
                      playedColor: Colors.white,
                      bufferedColor: Colors.white70,
                      backgroundColor: Colors.white38,
                    ),
                  ),
                ),
              ],
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
