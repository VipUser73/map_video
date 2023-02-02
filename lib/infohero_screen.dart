import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';
import 'package:map_video/model/person.dart';
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
                      DescriptionTextWidget(text: person.about),
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

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  const DescriptionTextWidget({super.key, required this.text});

  @override
  DescriptionTextWidgetState createState() => DescriptionTextWidgetState();
}

class DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  String shortText = '';
  String allText = '';

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      shortText = widget.text.substring(0, 50);
      allText = widget.text.substring(50, widget.text.length);
    } else {
      shortText = widget.text;
      allText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 9),
      decoration: const BoxDecoration(
          border: Border(
        left: BorderSide(
          color: blueColor,
          width: 5.0,
        ),
      )),
      child: allText.isEmpty
          ? Text(shortText)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(flag ? ("$shortText...") : (shortText + allText)),
                InkWell(
                  child: Text(
                    flag ? "Читать полностью" : "Свернуть",
                    style: const TextStyle(color: Colors.blue),
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}
