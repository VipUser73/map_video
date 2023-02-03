import 'package:flutter/material.dart';
import 'package:map_video/model/person.dart';
import 'package:map_video/widgets/description_hero.dart';
import 'package:video_player/video_player.dart';

class InfoHeroScreen extends StatefulWidget {
  const InfoHeroScreen({super.key});

  @override
  State<InfoHeroScreen> createState() => _InfoHeroScreenState();
}

class _InfoHeroScreenState extends State<InfoHeroScreen> {
  VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset('assets/video.mp4')..initialize();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final person = (ModalRoute.of(context)?.settings.arguments as Person);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: 340,
                  child: ListView(
                    children: [
                      Text(
                        person.name.replaceAll('\n', ' '),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(person.label),
                      const SizedBox(height: 16),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: VideoPlayer(controller!),
                          ),
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/video'),
                            icon: const Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 60,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      DescriptionHeroWidget(text: person.about),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              left: 30,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/icons/back.png",
                      scale: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
