class Constants {
  static String appName = "Road Vision";
  static String appTitle = "Road Vision";

  //regex
  static const String PASSWORD_REGEX =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,}$';
  static const String EMAIL_REGEX =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String Name_REGEX = r"^[a-zA-Z]{4,}(?: [a-zA-Z]+){0,2}$";
  static const String PHONE_REGEX = r"^\+?[0-9-]+$";
}
