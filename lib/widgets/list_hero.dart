import 'package:flutter/material.dart';
import 'package:map_video/components/dialog_hero.dart';
import 'package:map_video/model/person.dart';

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
