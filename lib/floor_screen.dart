import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';
import 'package:map_video/servises/repository.dart';
import 'package:map_video/widgets/bottom_button.dart';
import 'package:map_video/widgets/floor_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class FloorScreen extends StatelessWidget {
  const FloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final controller = PageController(initialPage: 1);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: size.width * 0.01,
              child: SizedBox(
                width: size.width,
                height: size.width,
                child: PageView(
                  controller: controller,
                  children: [
                    FloorWidget(
                      text1: FloorName.zero.floorName,
                      text2: firstFloorText,
                      src: "assets/images/map0.svg",
                    ),
                    FloorWidget(
                      text1: FloorName.first.floorName,
                      text2: firstFloorText,
                      src: "assets/images/map1.svg",
                    ),
                    FloorWidget(
                      text1: FloorName.second.floorName,
                      text2: firstFloorText,
                      src: "assets/images/map2.svg",
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.025,
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset(
                      "assets/icons/back.png",
                      scale: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('Карта'),
                ],
              ),
            ),
            Positioned(
                top: size.height * 0.05,
                right: 10,
                child: Column(
                  children: [
                    BottomButton(
                      press: () =>
                          Navigator.pushNamed(context, '/floor1/allhero'),
                      src: "assets/icons/people.png",
                    ),
                    const Text(
                      'Все герои',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )),
            Positioned(
              bottom: size.height * 0.05,
              left: size.width * 0.214,
              child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(),
                  onDotClicked: (index) => controller.jumpToPage(index)),
            )
          ],
        ),
      ),
    );
  }
}
