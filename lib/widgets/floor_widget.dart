import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_video/components/dialog_map.dart';

class FloorWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final String src;
  const FloorWidget({
    required this.text1,
    required this.text2,
    required this.src,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text1),
            GestureDetector(
              onTap: () => showDialogMap(context, text1),
              child: SizedBox(
                width: size.width * 0.33,
                height: size.height * 0.65,
                child: SvgPicture.asset(src),
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 50),
          width: size.width * 0.3,
          child: ListView(
            children: [
              Text(text2),
            ],
          ),
        ),
      ],
    );
  }
}
