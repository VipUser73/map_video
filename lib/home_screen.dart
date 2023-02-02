import 'package:flutter/material.dart';
import 'package:map_video/components/dialog_manual.dart';
import 'package:map_video/components/constants.dart';
import 'package:map_video/widgets/bottom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/limage.png",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/allerhand.png",
                width: 168,
                height: 35,
              ),
              const Text(
                homeLabelText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const SizedBox(
                  width: 300,
                  child: Text(
                    homeDescriptionText,
                    textAlign: TextAlign.center,
                  )),
              const SizedBox(height: 20),
              SizedBox(
                width: size.width * 0.35,
                height: size.height * 0.121,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomButton(
                      widthPercent2: 0.013,
                      press: () {},
                      src: "assets/icons/i.png",
                    ),
                    BottomButton(
                      widthPercent1: 0.144,
                      color: blueColor,
                      press: () => Navigator.pushNamed(context, '/floor1'),
                      src: "assets/icons/map.png",
                    ),
                    BottomButton(
                      press: () => showDialogManual(context),
                      src: "assets/icons/q.png",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/rimage.png",
          )
        ],
      ),
    );
  }
}
