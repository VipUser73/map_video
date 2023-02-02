import 'package:flutter/material.dart';
import 'package:map_video/components/constants.dart';
import 'package:map_video/model/person.dart';

Future<void> showDialogMap(BuildContext context, String floorName) async {
  final size = MediaQuery.of(context).size;
  final List<Person> listPerson =
      Person.listHero.where((element) => element.floor == floorName).toList();
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: size.width * 0.5,
                height: size.height * 0.09,
                child: const Text(
                  'Lorem ipsum dolor sit ametLorem ipsum dolor sit ametLorem ipsum dolor sit amet',
                  maxLines: 2,
                  style: TextStyle(fontSize: 11),
                ),
              ),
              SizedBox(
                height: size.height * 0.48,
                width: size.width * 0.5,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: listPerson.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) => Column(
                    children: [
                      Image.asset(
                        listPerson[index].avatar,
                        height: size.height * 0.255,
                      ),
                      Text(
                        listPerson[index].name,
                        style: const TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        listPerson[index].post,
                        style: const TextStyle(fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 76,
                        height: 24,
                        child: ElevatedButton(
                            onPressed: () => Navigator.pushNamed(
                                context, '/floor1/infohero',
                                arguments: listPerson[index]),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: blueColor,
                            ),
                            child: const Text(
                              'Выбрать',
                              style: TextStyle(fontSize: 10),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          actionsAlignment: MainAxisAlignment.center,
        );
      });
}
