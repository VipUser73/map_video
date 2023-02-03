import 'package:map_video/components/constants.dart';
import 'package:map_video/model/person.dart';

class Repository {
  static final List<Person> listHero = List.generate(
    8,
    (index) => Person(
      avatar: "assets/avatars/$index.png",
      name: "Фамилия Длинноеимя\nОтчество",
      post: "Должность",
      floor:
          index.isOdd ? FloorName.first.floorName : FloorName.second.floorName,
      label:
          "Lorem ipsum dolor sit amet\nLorem ipsum dolor sit ametLorem ipsum",
      about: firstFloorText,
    ),
  );
}

enum FloorName {
  zero('Цокольный этаж'),
  first('Первый этаж'),
  second('Второй этаж');

  final String floorName;
  const FloorName(this.floorName);
}
