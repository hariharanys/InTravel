class RestaurantModel {
  String? image;
  String? restaurant;
  String? place;
  String? timing;
  String? rating;
  String? price;

  RestaurantModel(
      {this.image,
      this.restaurant,
      this.place,
      this.timing,
      this.rating,
      this.price});
}

final RestaurantModel anandhas = RestaurantModel(
    image: 'assets/images/restaurant1.png',
    restaurant: 'Shree Anandhaas',
    place: 'Coimbatore',
    timing: '9:00 - 21:00',
    rating: '4.7',
    price: '\$2.3');
final RestaurantModel earls = RestaurantModel(
    image: 'assets/images/restaurant2.png',
    restaurant: 'Earls Secrets',
    place: 'Ooty',
    timing: '9:00 - 17:00',
    rating: '4.2',
    price: '\$2.5');
final RestaurantModel pasty = RestaurantModel(
    image: 'assets/images/restaurant3.png',
    restaurant: 'Pasty Corner',
    place: 'Kodaikanal',
    timing: '9:00 - 23:00',
    rating: '4.9',
    price: '\$5.3');
final RestaurantModel green = RestaurantModel(
    image: 'assets/images/restaurant4.png',
    restaurant: 'Green Kitchen Family',
    place: 'Theni',
    timing: '9:00 - 16:00',
    rating: '4.1',
    price: '\$1.3');
final RestaurantModel mangiamo = RestaurantModel(
    image: 'assets/images/restaurant5.png',
    restaurant: 'Mangiamo Restaurant',
    place: 'Salem',
    timing: '9:00 - 20:00',
    rating: '4.5',
    price: '\$3.3');

List<RestaurantModel> restaurantList = [
  anandhas,
  earls,
  pasty,
  green,
  mangiamo
];
