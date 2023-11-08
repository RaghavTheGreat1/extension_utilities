import 'dart:math';

extension SetExtension<E> on Set<E> {
  /// Returns a random element from this set.
  E random() {
    if (isEmpty) throw (Exception("Set is empty."));
    final random = Random();

    final randomIndex = random.nextInt(length);

    return elementAt(randomIndex) ;
  }

  /// Returns a random element from this set, or null if this set is empty.
  E? randomOrNull() {
    if (isEmpty) return null;

    final random = Random();

    final randomIndex = random.nextInt(length);

    return elementAtOrNull(randomIndex);
  }
}
