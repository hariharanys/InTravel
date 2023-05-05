class Excursion {
  String? place;
  String? hours;
  String? day;
  String? rating;
  String? image;
  bool? isSelected;

  Excursion({
    this.place,
    this.hours,
    this.day,
    this.rating,
    this.image,
    this.isSelected,
  });
}

final Excursion kodai = Excursion(
  place: 'Green Valley',
  hours: '9 - 5',
  day: 'mon . tue . thu',
  image: 'assets/images/excursion1.png',
  rating: '4.7',
  isSelected: false,
);
final Excursion theni = Excursion(
  place: 'Theni',
  hours: '9 - 3',
  day: 'mon . wed . fri',
  image: 'assets/images/excursion2.png',
  rating: '4.2',
  isSelected: false,
);
final Excursion kanya = Excursion(
  place: 'Kanyakumari',
  hours: '9 - 6',
  day: 'mon . tue . wed . thu . fri',
  image: 'assets/images/excursion3.png',
  rating: '4.5',
  isSelected: false,
);
final Excursion ooty = Excursion(
  place: 'Ooty',
  hours: '9 - 5',
  day: 'mon . wed . thu',
  image: 'assets/images/excursion4.png',
  rating: '4.9',
  isSelected: false,
);

List<Excursion> excursionList = [kodai, theni, kanya, ooty];

class Favorites {
  String? place;
  String? hours;
  String? day;
  String? rating;
  String? image;
  bool? isSelected;

  Favorites({
    this.place,
    this.hours,
    this.day,
    this.rating,
    this.image,
    this.isSelected,
  });
}

final Favorites kodaikanal = Favorites(
  place: 'Green Valley',
  hours: '9 - 5',
  day: 'mon . tue . thu',
  image: 'assets/images/excursion1.png',
  rating: '4.7',
  isSelected: false,
);
final Favorites theniga = Favorites(
  place: 'Theni',
  hours: '9 - 3',
  day: 'mon . wed . fri',
  image: 'assets/images/excursion2.png',
  rating: '4.2',
  isSelected: false,
);
final Favorites kanyakumari = Favorites(
  place: 'Kanyakumari',
  hours: '9 - 6',
  day: 'mon . tue . wed . thu . fri',
  image: 'assets/images/excursion3.png',
  rating: '4.5',
  isSelected: false,
);
final Favorites othagamandalam = Favorites(
  place: 'Ooty',
  hours: '9 - 5',
  day: 'mon . wed . thu',
  image: 'assets/images/excursion4.png',
  rating: '4.9',
  isSelected: false,
);

final Favorites cherai = Favorites(
  place: 'Cherai Beach',
  hours: '9 - 6',
  day: 'mon . tue . wed . thu . fri . sat . sun',
  image: 'assets/images/excursion5.png',
  rating: '4.5',
  isSelected: false,
);
final Favorites jog = Favorites(
  place: 'Jog Fall',
  hours: '9 - 3',
  day: 'mon . wed . fri',
  image: 'assets/images/excursion6.png',
  rating: '4.7',
  isSelected: false,
);
final Favorites araku = Favorites(
  place: 'Araku Valley',
  hours: '9 - 6',
  day: 'mon . tue . wed . thu . fri',
  image: 'assets/images/excursion7.png',
  rating: '4.5',
  isSelected: false,
);
final Favorites gandikota = Favorites(
  place: 'Gandikota',
  hours: '9 - 5',
  day: 'mon . wed . thu',
  image: 'assets/images/excursion8.png',
  rating: '4.2',
  isSelected: false,
);

List<Favorites> favoriteList = [
  kodaikanal,
  theniga,
  kanyakumari,
  othagamandalam,
  cherai,
  jog,
  araku,
  gandikota
];
