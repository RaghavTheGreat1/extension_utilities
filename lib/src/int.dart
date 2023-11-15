import 'dart:math';

extension IntExtension on int {
  /// Returns a random number by setting the value as max(exlusive).
  int random() {
    assert(this > 0,
        "Integer value should be greater than 0 for generating random number.");
    final random = Random();
    final number = random.nextInt(this);
    return number;
  }

  /// Converts an [int] into an ordinal number in [String].
  String toOrdinal() {
    final onesPlace = this % 10;
    final tensPlace = ((this / 10).floor()) % 10;
    if (tensPlace == 1) {
      return '${this}th';
    } else {
      switch (onesPlace) {
        case 1:
          return '${this}st';
        case 2:
          return '${this}nd';
        case 3:
          return '${this}rd';
        default:
          return '${this}th';
      }
    }
  }
}
