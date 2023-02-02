import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';
import 'package:map_video/model/person.dart';

Future<void> showDialogHero(BuildContext context, Person person) async {
  final size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    person.avatar,
                    height: size.height * 0.255,
                  ),
                  Text(
                    person.name,
                    style: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    person.post,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    person.label,
                    style: const TextStyle(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 130,
                    height: 24,
                    child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                            context, '/floor1/infohero',
                            arguments: person),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blueColor,
                        ),
                        child: const Text(
                          'Смотреть интервью',
                          style: TextStyle(fontSize: 10),
                        )),
                  ),
                ],
              ),
            ]);
      });
}
