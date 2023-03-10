import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoPlayerController? controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset('assets/video.mp4')
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().whenComplete(() => controller?.play());
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  bool isMuted = false;
  bool isPause = false;
  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return SafeArea(
        child: Stack(children: [
          AspectRatio(
            aspectRatio: controller!.value.aspectRatio,
            child: VideoPlayer(controller!),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset("assets/icons/close.png", height: 25),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            child: SizedBox(
              width: 130,
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      isPause = !isPause;
                      isPause ? controller!.pause() : controller!.play();
                      setState(() {});
                    },
                    child: isPause
                        ? const Icon(Icons.play_arrow,
                            color: Colors.white, size: 30)
                        : const Icon(Icons.pause,
                            color: Colors.white, size: 30),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller!.seekTo(Duration(
                          seconds: controller!.value.position.inSeconds - 10));
                    },
                    child: Image.asset("assets/icons/ago.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller!.seekTo(Duration(
                          seconds: controller!.value.position.inSeconds + 10));
                    },
                    child: Image.asset("assets/icons/forward.png"),
                  ),
                  GestureDetector(
                    onTap: () {
                      isMuted = !isMuted;
                      isMuted
                          ? controller!.setVolume(0)
                          : controller!.setVolume(1);
                      setState(() {});
                    },
                    child: isMuted
                        ? Image.asset("assets/icons/mute.png")
                        : Image.asset("assets/icons/volume.png"),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 5,
              child: VideoProgressIndicator(
                controller!,
                padding: EdgeInsets.zero,
                allowScrubbing: true,
                colors: VideoProgressColors(
                    backgroundColor: Colors.grey,
                    bufferedColor: Colors.grey.shade400,
                    playedColor: const Color.fromRGBO(46, 64, 131, 1)),
              )),
        ]),
      );
    } else {
      return const SizedBox();
    }
  }
}
