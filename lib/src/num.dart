import 'dart:math' show pi;

import 'package:intl/intl.dart';

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
  Duration get s => (this * 1000 * 1000).microseconds;

  /// Returns [Duration] with specified number
  Duration get seconds => (this * 1000 * 1000).microseconds;

  /// Returns [Duration] with specified number
  Duration get mins => (this * 1000 * 1000 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get minutes => (this * 1000 * 1000 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get hrs => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get hours => (this * 1000 * 1000 * 60 * 60).microseconds;

  /// Returns [Duration] with specified number
  Duration get days => (this * 1000 * 1000 * 60 * 60 * 24).microseconds;

  /// Formats the number with comma separators (e.g., 1,234,567)
  String get formatted => NumberFormat('#,##0.##').format(this);

  /// Formats the number as currency with the specified locale
  String toCurrency([String locale = 'en_US']) =>
      NumberFormat.currency(locale: locale).format(this);

  /// Formats the number as percentage
  String get percentage => NumberFormat.percentPattern().format(this / 100);

  /// Formats bytes to human readable string (e.g., 1.5 GB)
  String get formatBytes {
    if (this < 1024) return '$this B';
    if (this < 1048576) return '${(this / 1024).toFixed(1)} KB';
    if (this < 1073741824) return '${(this / 1048576).toFixed(1)} MB';
    return '${(this / 1073741824).toFixed(1)} GB';
  }

  /// Returns true if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns true if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns true if the number is positive
  bool get isPositive => this > 0;

  /// Returns true if the number is negative
  bool get isNegative => this < 0;

  /// Returns true if the number is zero
  bool get isZero => this == 0;

  /// Returns true if the number is an integer
  bool get isInteger => this % 1 == 0;

  /// Clamps the number between [min] and [max]
  num clamp(num min, num max) => this < min ? min : (this > max ? max : this);

  /// Returns true if the number is between [min] and [max] (inclusive)
  bool isBetween(num min, num max) => this >= min && this <= max;

  /// Returns true if the number is a prime number
  bool get isPrime {
    if (this <= 1) return false;
    if (this <= 3) return true;
    if (this % 2 == 0 || this % 3 == 0) return false;
    for (var i = 5; i * i <= this; i += 6) {
      if (this % i == 0 || this % (i + 2) == 0) return false;
    }
    return true;
  }

  /// Returns the factorial of the number
  num get factorial {
    if (this < 0)
      throw ArgumentError('Factorial is not defined for negative numbers');
    if (this <= 1) return 1;
    return this * (this - 1).factorial;
  }

  /// Creates an Iterable of numbers from [this] to [end] (exclusive)
  Iterable<num> until(num end, [num step = 1]) sync* {
    for (num i = this; i < end; i += step) {
      yield i;
    }
  }

  /// Creates an Iterable of numbers from [this] to [end] (inclusive)
  Iterable<num> to(num end, [num step = 1]) sync* {
    for (num i = this; i <= end; i += step) {
      yield i;
    }
  }

  /// Converts the number to Roman numerals
  String get toRoman {
    if (this <= 0 || this >= 4000) {
      throw ArgumentError('Number must be between 1 and 3999');
    }
    final List<MapEntry<int, String>> romanNumerals = [
      MapEntry(1000, 'M'),
      MapEntry(900, 'CM'),
      MapEntry(500, 'D'),
      MapEntry(400, 'CD'),
      MapEntry(100, 'C'),
      MapEntry(90, 'XC'),
      MapEntry(50, 'L'),
      MapEntry(40, 'XL'),
      MapEntry(10, 'X'),
      MapEntry(9, 'IX'),
      MapEntry(5, 'V'),
      MapEntry(4, 'IV'),
      MapEntry(1, 'I'),
    ];

    var num = toInt();
    var result = StringBuffer();
    for (var entry in romanNumerals) {
      while (num >= entry.key) {
        result.write(entry.value);
        num -= entry.key;
      }
    }
    return result.toString();
  }

  /// Converts degrees to radians
  double get toRadians => this * (pi / 180.0);

  /// Converts radians to degrees
  double get toDegrees => this * (180.0 / pi);

  /// Converts the number to ordinal string (1st, 2nd, 3rd, etc.)
  String get toOrdinal {
    if (this % 100 >= 11 && this % 100 <= 13) return '${this}th';
    switch (this % 10) {
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
