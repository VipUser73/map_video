import 'package:flutter/material.dart';
import 'package:map_video/model/person.dart';
import 'package:map_video/servises/repository.dart';
import 'package:map_video/widgets/list_hero.dart';

class AllHeroScreen extends StatelessWidget {
  const AllHeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final List<Person> personOnFirst = Repository.listHero
        .where((element) => element.floor == FloorName.first.floorName)
        .toList();
    final List<Person> personOnSecond = Repository.listHero
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
