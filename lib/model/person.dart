import 'package:map_video/components/constants.dart';

class Person {
  final String avatar;
  final String name;
  final String post;
  final String floor;
  final String label;
  final String about;

  Person({
    required this.avatar,
    required this.name,
    required this.post,
    required this.floor,
    required this.label,
    required this.about,
  });

  static final List<Person> listHero = List.generate(
    8,
    (index) => Person(
      avatar: "assets/avatars/$index.png",
      name: "Фамилия Длинноеимя\nОтчество",
      post: "Должность",
      floor: index.isOdd ? 'Первый этаж' : 'Второй этаж',
      label:
          "Lorem ipsum dolor sit amet\nLorem ipsum dolor sit ametLorem ipsum",
      about: firstFloorText,
    ),
  );
}