extension StringExtension on String {
  /// Checks if the [String] is [int] or not
  bool get isInt {
    try {
      toInt();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Parse [source] as a, possibly signed, integer literal and return its value.
  ///
  /// The [source] must be a non-empty sequence of base-[radix] digits,
  /// optionally prefixed with a minus or plus sign ('-' or '+').
  ///
  /// The [radix] must be in the range 2..36. The digits used are
  /// first the decimal digits 0..9, and then the letters 'a'..'z' with
  /// values 10 through 35. Also accepts upper-case letters with the same
  /// values as the lower-case ones.
  ///
  /// If no [radix] is given then it defaults to 10. In this case, the [source]
  /// digits may also start with `0x`, in which case the number is interpreted
  /// as a hexadecimal integer literal,
  /// When `int` is implemented by 64-bit signed integers,
  /// hexadecimal integer literals may represent values larger than
  /// 2<sup>63</sup>, in which case the value is parsed as if it is an
  /// *unsigned* number, and the resulting value is the corresponding
  /// signed integer value.
  ///
  /// For any int `n` and valid radix `r`, it is guaranteed that
  /// `n == int.parse(n.toRadixString(r), radix: r)`.
  ///
  /// If the [source] string does not contain a valid integer literal,
  /// optionally prefixed by a sign, a [FormatException] is thrown.
  ///
  /// Rather than throwing and immediately catching the [FormatException],
  /// instead use [tryParse] to handle a potential parsing error.
  ///
  /// Example:
  /// ```dart
  /// var value = int.tryParse(text);
  /// if (value == null) {
  ///   // handle the problem
  ///   // ...
  /// }
  /// ```
  int toInt({int? radix}) {
    return int.parse(this, radix: radix);
  }

  /// Parse [source] as a, possibly signed, integer literal.
  ///
  /// Like [parse] except that this function returns `null` where a
  /// similar call to [parse] would throw a [FormatException].
  ///
  /// Example:
  /// ```dart
  /// print(int.tryParse('2021')); // 2021
  /// print(int.tryParse('1f')); // null
  /// // From binary (base 2) value.
  /// print(int.tryParse('1100', radix: 2)); // 12
  /// print(int.tryParse('00011111', radix: 2)); // 31
  /// print(int.tryParse('011111100101', radix: 2)); // 2021
  /// // From octal (base 8) value.
  /// print(int.tryParse('14', radix: 8)); // 12
  /// print(int.tryParse('37', radix: 8)); // 31
  /// print(int.tryParse('3745', radix: 8)); // 2021
  /// // From hexadecimal (base 16) value.
  /// print(int.tryParse('c', radix: 16)); // 12
  /// print(int.tryParse('1f', radix: 16)); // 31
  /// print(int.tryParse('7e5', radix: 16)); // 2021
  /// // From base 35 value.
  /// print(int.tryParse('y1', radix: 35)); // 1191 == 34 * 35 + 1
  /// print(int.tryParse('z1', radix: 35)); // null
  /// // From base 36 value.
  /// print(int.tryParse('y1', radix: 36)); // 1225 == 34 * 36 + 1
  /// print(int.tryParse('z1', radix: 36)); // 1261 == 35 * 36 + 1
  /// ```
  int? tryToInt({int? radix}) {
    return int.tryParse(this, radix: radix);
  }

  /// Checks if the [String] is [double] or not
  bool get isDouble {
    try {
      toDouble();
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Parse [source] as a double literal and return its value.
  ///
  /// Accepts an optional sign (`+` or `-`) followed by either the characters
  /// "Infinity", the characters "NaN" or a floating-point representation.
  /// A floating-point representation is composed of a mantissa and an optional
  /// exponent part. The mantissa is either a decimal point (`.`) followed by a
  /// sequence of (decimal) digits, or a sequence of digits
  /// optionally followed by a decimal point and optionally more digits. The
  /// (optional) exponent part consists of the character "e" or "E", an optional
  /// sign, and one or more digits.
  /// The [source] must not be `null`.
  ///
  /// Leading and trailing whitespace is ignored.
  ///
  /// Throws a [FormatException] if the [source] string is not
  /// a valid double literal.
  ///
  /// Rather than throwing and immediately catching the [FormatException],
  /// instead use [tryParse] to handle a potential parsing error.
  ///
  /// Examples of accepted strings:
  /// ```
  /// "3.14"
  /// "  3.14 \xA0"
  /// "0."
  /// ".0"
  /// "-1.e3"
  /// "1234E+7"
  /// "+.12e-9"
  /// "-NaN"
  /// ```
  double toDouble() {
    return double.parse(this);
  }

  /// Parse [source] as a double literal and return its value.
  ///
  /// Like [parse], except that this function returns `null` for invalid inputs
  /// instead of throwing.
  ///
  /// Example:
  /// ```dart
  /// var value = double.tryParse('3.14'); // 3.14
  /// value = double.tryParse('  3.14 \xA0'); // 3.14
  /// value = double.tryParse('0.'); // 0.0
  /// value = double.tryParse('.0'); // 0.0
  /// value = double.tryParse('-1.e3'); // -1000.0
  /// value = double.tryParse('1234E+7'); // 12340000000.0
  /// value = double.tryParse('+.12e-9'); // 1.2e-10
  /// value = double.tryParse('-NaN'); // NaN
  /// value = double.tryParse('0xFF'); // null
  /// value = double.tryParse(double.infinity.toString()); // Infinity
  /// ```
  double? tryToDouble() {
    return double.tryParse(this);
  }

  /// Checks if the [String] is boolean.
  bool get isBool => (this == 'true' || this == 'false');

  /// Parses [source] as an, optionally case-insensitive, boolean literal.
  ///
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  /// which returns the results `true` and `false` respectively.
  ///
  /// If [caseSensitive] is `false`, any combination of upper and lower case
  /// ASCII letters in the words `"true"` and `"false"` are accepted,
  /// as if the input was first lower-cased.
  ///
  /// Throws a [FormatException] if the [source] string does not contain
  /// a valid boolean literal.
  ///
  /// Rather than throwing and immediately catching the [FormatException],
  /// instead use [tryParse] to handle a potential parsing error.
  ///
  /// Example:
  /// ```dart
  /// print(bool.parse('true')); // true
  /// print(bool.parse('false')); // false
  /// print(bool.parse('TRUE')); // throws FormatException
  /// print(bool.parse('TRUE', caseSensitive: false)); // true
  /// print(bool.parse('FALSE', caseSensitive: false)); // false
  /// print(bool.parse('NO')); // throws FormatException
  /// print(bool.parse('YES')); // throws FormatException
  /// print(bool.parse('0')); // throws FormatException
  /// print(bool.parse('1')); // throws FormatException
  /// ```
  bool toBool({bool caseSensitive = true}) {
    return bool.parse(this, caseSensitive: caseSensitive);
  }

  /// Parses [source] as an, optionally case-insensitive, boolean literal.
  ///
  /// If [caseSensitive] is `true`, which is the default,
  /// the only accepted inputs are the strings `"true"` and `"false"`,
  /// which returns the results `true` and `false` respectively.
  ///
  /// If [caseSensitive] is `false`, any combination of upper and lower case
  /// ASCII letters in the words `"true"` and `"false"` are accepted,
  /// as if the input was first lower-cased.
  ///
  /// Returns `null` if the [source] string does not contain a valid
  /// boolean literal.
  ///
  /// If the input can be assumed to be valid, use [bool.parse] to avoid
  /// having to deal with a possible `null` result.
  ///
  /// Example:
  /// ```dart
  /// print(bool.tryParse('true')); // true
  /// print(bool.tryParse('false')); // false
  /// print(bool.tryParse('TRUE')); // null
  /// print(bool.tryParse('TRUE', caseSensitive: false)); // true
  /// print(bool.tryParse('FALSE', caseSensitive: false)); // false
  /// print(bool.tryParse('NO')); // null
  /// print(bool.tryParse('YES')); // null
  /// print(bool.tryParse('0')); // null
  /// print(bool.tryParse('1')); // null
  /// ``
  bool? tryToBool({bool caseSensitive = true}) {
    return bool.tryParse(this, caseSensitive: caseSensitive);
  }

  /// Capitalizes first letter of a [String] while persisting the case of rest of it.
  ///
  /// Example:
  ///
  /// raghav joshi -> Raghav joshi
  ///
  /// virat Kohli goes for 100 -> Virat Kohli goes for 100
  ///
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Returns capitalized version of the [String].
  ///
  /// Example:
  ///
  /// raghav joshi -> Raghav Joshi
  ///
  String capitalizeAllWords() {
    if (isEmpty) return this;
    return split(' ').map((e) => e.capitalize()).join(' ');
  }

  /// Checks whether this regular expression has a match in the [pattern].
  bool hasMatch(String pattern) {
    return RegExp(pattern).hasMatch(this);
  }

  /// Checks if [String] consists of only digits [0-9].
  bool get containsOnlyNumbers => hasMatch(r'^[0-9]+$');

  /// Checks if string consist only alphabets [a-z or A-Z] while not allowing
  /// whitespace characters (spaces, tabs, newlines).
  bool get containsOnlyAlphabets => hasMatch(r'^[a-zA-Z]+$');

  /// Checks if string consist only alphabets [a-z or A-Z] while not allowing
  /// whitespace characters (spaces, tabs, newlines).
  bool get containsOnlyAlphabetsAndSpace => hasMatch(r'^[a-zA-Z\s]+$');
}
