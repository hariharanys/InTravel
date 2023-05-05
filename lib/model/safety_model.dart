class SafetyModel {
  String? safety;
  String? image;

  SafetyModel({this.safety, this.image});
}

final SafetyModel safety1 = SafetyModel(
    safety: 'Disinfect surfaces around your home and work.',
    image: 'assets/images/safety1.png');
final SafetyModel safety2 = SafetyModel(
    safety: 'Wash your hands for at least 20 seconds.',
    image: 'assets/images/safety2.png');
final SafetyModel safety3 =
    SafetyModel(safety: 'Wear Masks.', image: 'assets/images/safety3.png');

List<SafetyModel> safetylist = [safety1, safety2, safety3];
