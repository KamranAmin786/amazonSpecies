import 'package:africa/app_utils/utilities.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key, required this.video});

  final String video;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(widget.video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
       backgroundColor: colorBlack,
       foregroundColor: colorWhite,
        title: const Text("VideoPlayer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoPlayerController.value.isInitialized
              ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController))
              : Container(),
          VideoProgressIndicator(
            _videoPlayerController,
            allowScrubbing: true,
            colors: const VideoProgressColors(
                backgroundColor: colorWhite,
                bufferedColor: colorBlack,
                playedColor: colorYellowAccent),
          ),
          const Padding(
            padding: EdgeInsets.all(20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(colorYellowAccent),
                      fixedSize: MaterialStateProperty.all<Size>(const Size(70, 70)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)))),
                  onPressed: () {
                    _videoPlayerController.play();
                  },
                  child: const Icon(Icons.play_arrow,color: colorBlack,)),

              const Padding(padding: EdgeInsets.all(2)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent),
                      fixedSize: MaterialStateProperty.all(const Size(70, 70)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)))),
                  onPressed: () {
                    _videoPlayerController.pause();
                  },
                  child: const Icon(Icons.pause,color: colorBlack,)),
              const Padding(padding: EdgeInsets.all(2)),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
                      fixedSize: MaterialStateProperty.all(const Size(70, 70)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)))),
                  onPressed: () {
                    _videoPlayerController.seekTo(Duration(
                        seconds: _videoPlayerController.value.position.inSeconds + 10));
                  },
                  child: const Icon(Icons.fast_forward,color: colorBlack,)),
            ],
          ),
        ],
      ),
    );
  }
}
