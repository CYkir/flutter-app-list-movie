extension DurationFormatter on int {
  String toDurationFormat() {
    final int hours = this ~/ 60;
    final int minutes = this % 60;

    if (hours > 0) {
      return "${hours}h ${minutes}m";
    } else {
      return "${minutes}m";
    }
  }

  String toDurationIndo() {
    final int hours = this ~/ 60;
    final int minutes = this % 60;

    if (hours > 0) {
      return "${hours} jam ${minutes} menit";
    } else {
      return "${minutes} menit";
    }
  }
}
