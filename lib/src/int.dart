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
}
