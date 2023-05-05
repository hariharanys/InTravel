import 'package:flutter/material.dart';

class EventModel {
  String? imageUrl;
  String? price;
  String? place;
  String? hotel;
  String? month;
  String? date;
  String? logo;
  String? rating;

  EventModel(
      {this.imageUrl,
      this.price,
      this.place,
      this.hotel,
      this.month,
      this.date,
      this.logo,
      this.rating});
}

final EventModel cafeix = EventModel(
    imageUrl: 'assets/images/image1.png',
    place: 'Kothagiri',
    price: '120',
    hotel: 'Cafeix',
    month: 'jan',
    date: '12 - 15',
    logo: 'assets/images/logo1.png',
    rating: '4.5');
final EventModel cafewine = EventModel(
    imageUrl: 'assets/images/image2.png',
    place: 'Kodai',
    price: '200',
    hotel: 'Cafewine',
    month: 'Feb',
    date: '1 - 15',
    logo: 'assets/images/logo2.png',
    rating: '5.0');
final EventModel teakwood = EventModel(
    imageUrl: 'assets/images/image3.png',
    place: 'Pondi',
    price: '80',
    hotel: 'Teakwood',
    month: 'Mar',
    date: '10 - 27',
    logo: 'assets/images/logo3.png',
    rating: '4.0');
final EventModel taj = EventModel(
    imageUrl: 'assets/images/image4.png',
    place: 'Taj',
    price: '180',
    hotel: 'Eutophia',
    month: 'Apr',
    date: '16 - 25',
    logo: 'assets/images/logo4.png',
    rating: '3.5');
final EventModel gudalur = EventModel(
    imageUrl: 'assets/images/image5.png',
    place: 'Gudalur',
    price: '320',
    hotel: 'TN-47',
    month: 'May',
    date: '11 - 19',
    logo: 'assets/images/logo5.png',
    rating: '4.2');

List<EventModel> eventList = [cafeix, cafewine, teakwood, taj, gudalur];
