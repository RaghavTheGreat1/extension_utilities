extension NumExtension on num {
  /// Uses [toStringAsFixed] method to convert the give number to specific precision
  /// & returns the value as [double] rather than [String].
  double toFixed([int precision = 2]) {
    assert(precision > 0, "Precision should be greater than 0");
    final result = toStringAsFixed(precision);
    final resultAsDouble = double.parse(result);
    return resultAsDouble;
  }

  /// Returns [Duration] with specified number
  Duration get microseconds => Duration(microseconds: round());

  /// Returns [Duration] with specified number
  Duration get ms => (this * 1000).microseconds;

  /// Returns [Duration] with specified number
  Duration get milliseconds => (this * 1000).microseconds;

  /// Returns [Duration] with specified number
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Returns [Duration] with specified number
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;
}
