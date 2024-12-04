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

  /// Returns the first element that satisfies the given predicate [test], or null if no element satisfies the predicate.
  E? firstWhereOrNull(bool Function(E) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }

  /// Returns the first element that satisfies the given predicate [test], or null if no element satisfies the predicate.
  Iterable<E>? whereOrNull(bool Function(E) test) {
    try {
      return where(test);
    } catch (e) {
      return null;
    }
  }

  /// Returns the last element that satisfies the given predicate [test], or null if no element satisfies the predicate.
  E? lastWhereOrNull(bool Function(E) test) {
    try {
      return lastWhere(test);
    } catch (e) {
      return null;
    }
  }

  /// Returns the element at the specified index, or null if the index is out of bounds
  E? elementAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return this[index];
  }

  /// Returns a single element satisfying the predicate, or null if zero or multiple elements match
  E? singleWhereOrNull(bool Function(E) test) {
    try {
      return singleWhere(test);
    } catch (e) {
      return null;
    }
  }

  /// Returns the reduced value using the combine function, or null if the list is empty
  E? reduceOrNull(E Function(E value, E element) combine) {
    try {
      return reduce(combine);
    } catch (e) {
      return null;
    }
  }

  /// Returns the index of the first element matching the predicate, or null if not found
  int? indexWhereOrNull(bool Function(E) test, [int start = 0]) {
    final index = indexWhere(test, start);
    return index == -1 ? null : index;
  }

  /// Returns the last index of the element matching the predicate, or null if not found
  int? lastIndexWhereOrNull(bool Function(E) test, [int? start]) {
    final index = lastIndexWhere(test, start ?? length - 1);
    return index == -1 ? null : index;
  }

  /// Returns the index of the first occurrence of [element], or null if not found
  int? indexOfOrNull(E element, [int start = 0]) {
    final index = indexOf(element, start);
    return index == -1 ? null : index;
  }

  /// Returns the last index of [element], or null if not found
  int? lastIndexOfOrNull(E element, [int? start]) {
    final index = lastIndexOf(element, start);
    return index == -1 ? null : index;
  }

  /// Removes and returns the last element from the list, or null if the list is empty
  E? removeLastOrNull() {
    if (isEmpty) return null;
    return removeLast();
  }

  /// Removes and returns the element at the specified index, or null if the index is out of bounds
  E? removeAtOrNull(int index) {
    if (index < 0 || index >= length) return null;
    return removeAt(index);
  }

  /// Removes the first occurrence of [element] from the list and returns true, or false if not found
  bool removeOrNull(E element) {
    try {
      return remove(element);
    } catch (e) {
      return false;
    }
  }
}
