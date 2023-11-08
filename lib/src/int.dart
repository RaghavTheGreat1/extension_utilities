import 'dart:math';

extension IntExtension on int {
  /// Returns a random number by setting the value as max(exlusive).
  int random() {
    final random = Random();
    final number = random.nextInt(this);
    return number;
  }
}
