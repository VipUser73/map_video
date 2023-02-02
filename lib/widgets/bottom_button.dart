import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final double widthPercent1;
  final double widthPercent2;

  final Color color;
  final VoidCallback press;

  final String src;

  const BottomButton({
    Key? key,
    this.widthPercent1 = 0.09,
    this.widthPercent2 = 0.04,
    this.color = const Color.fromRGBO(230, 230, 230, 1),
    required this.press,
    required this.src,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * widthPercent1,
      height: size.height * 0.121,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: press,
        child: Image.asset(src, width: size.width * widthPercent2),
      ),
    );
  }
}
