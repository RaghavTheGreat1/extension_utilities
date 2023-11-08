extension NumExtension on num {
  /// Uses [toStringAsFixed] method to convert the give number to specific precision
  /// & returns the value as [double] rather than [String].
  double toFixed([int precision = 2]) {
    assert(precision > 0, "Precision should be greater than 0");
    final result = toStringAsFixed(precision);
    final resultAsDouble = double.parse(result);
    return resultAsDouble;
  }
}
