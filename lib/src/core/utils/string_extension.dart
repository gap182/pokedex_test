extension StringX on String {
  String get upperCaseFirst =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}
