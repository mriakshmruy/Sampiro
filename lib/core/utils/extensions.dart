extension StringExtension on String {
  String capitalize() => this[0].toUpperCase() + substring(1);
  String lowerCapsAndAddPeriod() => '${toLowerCase()}.';
}

extension IntExtension on int {
  int squared() => this * this;
}
