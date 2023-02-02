import 'package:flutter/material.dart';
import 'package:map_video/components/dialog_hero.dart';
import 'package:map_video/model/person.dart';

class AllHeroScreen extends StatelessWidget {
  const AllHeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Person> personOnFirst = Person.listHero
        .where((element) => element.floor == FloorName.first.floorName)
        .toList();
    final List<Person> personOnSecond = Person.listHero
        .where((element) => element.floor == FloorName.second.floorName)
        .toList();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: size.width * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Карта'),
                    const SizedBox(height: 6),
                    ListHero(persons: personOnFirst),
                    ListHero(persons: personOnSecond),
                  ],
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

class ListHero extends StatelessWidget {
  const ListHero({
    Key? key,
    required this.persons,
  }) : super(key: key);

  final List<Person> persons;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.7,
      height: size.height * 0.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(persons.first.floor,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: persons.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => showDialogHero(context, persons[index]),
                child: Column(
                  children: [
                    Image.asset(
                      persons[index].avatar,
                      height: size.height * 0.255,
                    ),
                    Text(
                      persons[index].name,
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      persons[index].post,
                      style: const TextStyle(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
