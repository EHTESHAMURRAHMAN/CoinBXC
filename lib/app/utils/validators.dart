
bool phoneNumberValidator(String value) {
  String pattern = r'^(?:[+0]9)?[0-9]{10}$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(value);
}

bool emailValidator(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(value);
}

bool passwordValidator(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(value);
}

bool panCardValidator(String value) {
  // "[A-Z]{5}[0-9]{4}[A-Z]{1}"
  String pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}';
  RegExp regex = RegExp(pattern);
  return regex.hasMatch(value);
}