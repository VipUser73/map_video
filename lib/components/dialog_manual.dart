import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Future<void> showDialogManual(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        final controller = PageController();
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('Заголовок'),
              SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: const ScrollingDotsEffect(),
                  onDotClicked: (index) => controller.jumpToPage(index))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                width: 200,
                child: PageView(
                  controller: controller,
                  children: [
                    Container(color: Colors.yellow),
                    Container(color: Colors.red),
                    Container(color: Colors.black),
                  ],
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (controller.page == 2) {
                        Navigator.pop(context);
                      }
                      controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.ease);
                    },
                    child: const Text("Далее")),
              ],
            ),
          ],
        );
      });
}
