import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';

class DescriptionHeroWidget extends StatefulWidget {
  final String text;

  const DescriptionHeroWidget({super.key, required this.text});

  @override
  State<DescriptionHeroWidget> createState() => _DescriptionHeroWidgetState();
}

class _DescriptionHeroWidgetState extends State<DescriptionHeroWidget> {
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
