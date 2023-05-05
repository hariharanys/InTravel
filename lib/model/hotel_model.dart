class HotelModel {
  String? image;
  String? hotel;
  String? price;
  String? rating;
  bool? wifi;
  bool? ratedHost;
  bool? foodAvailable;

  HotelModel(
      {this.image,
      this.hotel,
      this.price,
      this.rating,
      this.wifi,
      this.ratedHost,
      this.foodAvailable});
}

final HotelModel lemeridian = HotelModel(
    image: 'assets/images/hotel1.png',
    hotel: 'Le Meridian',
    price: '\$70',
    rating: '4.6',
    wifi: true,
    ratedHost: true,
    foodAvailable: true);
final HotelModel olives = HotelModel(
    image: 'assets/images/hotel2.png',
    hotel: 'Olives Pleasant Stays',
    price: '\$30',
    rating: '4.3',
    wifi: true,
    ratedHost: true,
    foodAvailable: false);
final HotelModel kodaiResort = HotelModel(
    image: 'assets/images/hotel3.png',
    hotel: 'Kodai Resort',
    price: '\$40',
    rating: '3.6',
    wifi: true,
    ratedHost: false,
    foodAvailable: false);

List<HotelModel> hotelList = [lemeridian, olives, kodaiResort];
