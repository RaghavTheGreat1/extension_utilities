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

  /// Returns true if the number is even
  bool get isEven => this % 2 == 0;

  /// Returns true if the number is odd
  bool get isOdd => this % 2 != 0;

  /// Returns true if the number is prime
  bool get isPrime {
    if (this <= 1) return false;
    if (this <= 3) return true;
    if (this % 2 == 0 || this % 3 == 0) return false;

    for (int i = 5; i * i <= this; i += 6) {
      if (this % i == 0 || this % (i + 2) == 0) return false;
    }
    return true;
  }

  /// Returns the factorial of the number
  int factorial() {
    if (this < 0)
      throw ArgumentError('Factorial is not defined for negative numbers');
    if (this <= 1) return 1;
    return this * (this - 1).factorial();
  }

  /// Converts the integer to Roman numerals
  String toRoman() {
    if (this < 1 || this > 3999) {
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

    var num = this;
    var result = StringBuffer();

    for (var entry in romanNumerals) {
      while (num >= entry.key) {
        result.write(entry.value);
        num -= entry.key;
      }
    }

    return result.toString();
  }

  /// Returns a Duration representing this many milliseconds
  Duration get milliseconds => Duration(milliseconds: this);

  /// Returns a Duration representing this many seconds
  Duration get seconds => Duration(seconds: this);

  /// Returns a Duration representing this many minutes
  Duration get minutes => Duration(minutes: this);

  /// Returns a Duration representing this many hours
  Duration get hours => Duration(hours: this);

  /// Returns a Duration representing this many days
  Duration get days => Duration(days: this);

  /// Returns true if the year is a leap year
  bool get isLeapYear {
    if (this % 4 == 0) {
      if (this % 100 == 0) {
        if (this % 400 == 0) {
          return true;
        }
        return false;
      }
      return true;
    }
    return false;
  }

  /// Converts the integer to words (works for numbers up to 999,999,999,999)
  String toWords() {
    if (this == 0) return 'zero';

    final units = [
      '',
      'one',
      'two',
      'three',
      'four',
      'five',
      'six',
      'seven',
      'eight',
      'nine',
      'ten',
      'eleven',
      'twelve',
      'thirteen',
      'fourteen',
      'fifteen',
      'sixteen',
      'seventeen',
      'eighteen',
      'nineteen'
    ];
    final tens = [
      '',
      '',
      'twenty',
      'thirty',
      'forty',
      'fifty',
      'sixty',
      'seventy',
      'eighty',
      'ninety'
    ];
    final scales = ['', 'thousand', 'million', 'billion'];

    String convertLessThanThousand(int n) {
      if (n == 0) return '';

      if (n < 20) return units[n];

      if (n < 100) {
        return tens[n ~/ 10] + (n % 10 != 0 ? '-${units[n % 10]}' : '');
      }

      return '${units[n ~/ 100]} hundred${n % 100 != 0 ? ' and ${convertLessThanThousand(n % 100)}' : ''}';
    }

    var num = this;
    if (num < 0) {
      return 'negative ${(-num).toWords()}';
    }

    var words = <String>[];
    var scaleIndex = 0;

    while (num > 0) {
      if (num % 1000 != 0) {
        var thisPart = convertLessThanThousand(num % 1000);
        if (scaleIndex > 0) {
          thisPart += ' ${scales[scaleIndex]}';
        }
        words.insert(0, thisPart);
      }
      num = num ~/ 1000;
      scaleIndex++;
    }

    return words.join(' ');
  }

  /// Pads the number with leading zeros to reach the specified length
  String padLeft(int width) => toString().padLeft(width, '0');

  /// Returns a list of divisors of the number
  List<int> get divisors {
    var result = <int>[];
    for (var i = 1; i <= sqrt(this); i++) {
      if (this % i == 0) {
        result.add(i);
        if (i != this ~/ i) {
          result.add(this ~/ i);
        }
      }
    }
    return result..sort();
  }

  /// Returns the Greatest Common Divisor with another number
  int gcd(int other) {
    int a = abs();
    int b = other.abs();
    while (b != 0) {
      var t = b;
      b = a % b;
      a = t;
    }
    return a;
  }

  /// Returns the Least Common Multiple with another number
  int lcm(int other) {
    return (this * other).abs() ~/ gcd(other);
  }
}
