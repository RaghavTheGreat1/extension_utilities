import 'dart:math';

extension ListExtension<E> on List<E> {
  /// Returns a random element from this list.
  E random({int? start, int? end}) {
    if (isEmpty) throw (Exception("List is empty."));
    start ??= 0;
    end ??= length - 1;

    assert(
        start < length, "Start index should be less than then length of list");
    assert(end < length, "End index should be less than then length of list");
    assert(start <= end, "Start index should be less than end index");

    final random = Random();

    final randomIndex = start + random.nextInt(end - start + 1);

    return this[randomIndex];
  }

  /// Returns a random element from this list, or null if this list is empty.
  E? randomOrNull({int? start, int? end}) {
    if (isEmpty) return null;
    start ??= 0;
    end ??= length - 1;

    assert(
        start < length, "Start index should be less than then length of list");
    assert(end < length, "End index should be less than then length of list");
    assert(start <= end, "Start index should be less than end index");

    final random = Random();

    final randomIndex = start + random.nextInt(end - start + 1);

    return this[randomIndex];
  }

  /// Inserts an element into the list at the specified index.
  E get(
    int index,
  ) {
    assert(index < length, "Index should be less than the size of the list");

    return this[index];
  }

  /// Replaces the element at the specified position in this list with the specified element.
  /// Returns: the element previously at the specified position.
  E set(
    int index,
    E element,
  ) {
    assert(index < length, "Index should be less than the size of the list");
    final previousElement = this[index];
    this[index] = element;
    return previousElement;
  }
}
