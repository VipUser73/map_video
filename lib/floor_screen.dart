import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';
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
            PageView(
              controller: controller,
              children: const [
                FloorWidget(
                  text1: 'Цокольный этаж',
                  text2: firstFloorText,
                  src: "assets/images/map0.svg",
                ),
                FloorWidget(
                  text1: 'Первый этаж',
                  text2: firstFloorText,
                  src: "assets/images/map1.svg",
                ),
                FloorWidget(
                  text1: 'Второй этаж',
                  text2: firstFloorText,
                  src: "assets/images/map2.svg",
                ),
              ],
            ),
            Positioned(
                top: 24,
                left: size.width * 0.083,
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
                )),
            Positioned(
                top: 20,
                right: 20,
                child: Column(
                  children: [
                    BottomButton(
                      press: () => Navigator.pushNamed(context, '/video'),
                      src: "assets/icons/people.png",
                    ),
                    const Text('Все герои')
                  ],
                )),
            Positioned(
              bottom: size.height * 0.07,
              left: size.width * 0.205,
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
