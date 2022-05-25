extension IntX on int {
  String formatPokeId() {
    if (this <= 9) {
      return "00$this";
    } else if (this > 9 && this <= 99) {
      return "0$this";
    } else {
      return "$this";
    }
  }
}
