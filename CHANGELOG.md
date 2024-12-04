## 1.2.0

### Added
- Enhanced `IntExtension` with numerous utility methods:
  - `isEven`/`isOdd` getters for quick parity checks
  - `isPrime` getter to check if a number is prime
  - `factorial()` method for calculating factorials
  - `toRoman()` for converting integers to Roman numerals
  - Time-related getters: `milliseconds`, `seconds`, `minutes`, `hours`, `days`
  - `isLeapYear` getter for checking leap years
  - `toWords()` method for converting numbers to English words (up to billions)
  - `padLeft()` method for zero-padding numbers
  - `divisors` getter for finding all divisors of a number
  - `gcd()` method for finding Greatest Common Divisor
  - `lcm()` method for finding Least Common Multiple

- Added new Set utilities:
    - `whereSet` - Returns a new set with elements that satisfy the given predicate
    - `mapSet` - Returns a new set with elements transformed by the given mapper
    - `any` - Returns true if any element matches the given predicate
    - `all` - Returns true if all elements match the given predicate
    - `none` - Returns true if no elements match the given predicate
    - `addIfNotNull` - Returns a new set with an element added if it's not null
    - `addAllIfNotNull` - Returns a new set with all non-null elements added
    - `firstWhereOrNull` - Returns the first element matching a predicate or null
    - `slice` - Returns a new set with elements at specified indices
    - `containsAll` - Checks if set contains all elements from another iterable
    - `containsAny` - Checks if set contains any elements from another iterable
    - `groupBy` - Groups elements into a map of sets by a key function
    - `distinctBy` - Removes duplicates based on a key function
    - `chunked` - Splits the set into chunks of given size
    - `sorted` - Returns a new set with elements sorted by a compare function
    - `sortedBy` - Returns a new set sorted by a key function
    - `sortedByDescending` - Returns a new set sorted in descending order by a key function

- Enhanced `NumExtension` with comprehensive utility methods:
  - **Number Formatting**
    - `formatted` - Adds thousand separators (e.g., 1,234,567)
    - `toCurrency` - Formats number as currency with locale support
    - `percentage` - Formats number as percentage
    - `formatBytes` - Human-readable byte format (e.g., 1.5 GB)
  
  - **Mathematical Utilities**
    - `isEven` - Check if number is even
    - `isOdd` - Check if number is odd
    - `isPositive` - Check if number is positive
    - `isNegative` - Check if number is negative
    - `isZero` - Check if number is zero
    - `isInteger` - Check if number is an integer
    - `clamp` - Restrict number to a range
    - `isBetween` - Check if number is in range
    - `isPrime` - Check if number is prime
    - `factorial` - Calculate factorial
  
  - **Range Utilities**
    - `until` - Create range (exclusive)
    - `to` - Create range (inclusive)
  
  - **Conversion Utilities**
    - `toRoman` - Convert to Roman numerals
    - `toRadians` - Convert degrees to radians
    - `toDegrees` - Convert radians to degrees
    - `toOrdinal` - Convert to ordinal string (1st, 2nd, 3rd, etc.)

- Added new List Extensions:
  - `elementAtOrNull` - Returns the element at index or null if out of bounds
  - `singleWhereOrNull` - Returns single matching element or null if none/multiple found
  - `reduceOrNull` - Returns reduced value or null if list is empty
  - `indexWhereOrNull` - Returns first matching index or null if not found
  - `lastIndexWhereOrNull` - Returns last matching index or null if not found
  - `indexOfOrNull` - Returns first index of element or null if not found
  - `lastIndexOfOrNull` - Returns last index of element or null if not found
  - `removeLastOrNull` - Removes and returns last element or null if empty
  - `removeAtOrNull` - Removes and returns element at index or null if out of bounds
  - `removeOrNull` - Removes first occurrence and returns success boolean

## 1.1.0

- add .ms, .millisecond, .s, .seconds, .mins, .minutes, .hr, .hours, on num that returns [Duration]

## 1.0.2

- add .toInt() & .tryToInt() method on [String]
- add .toDouble() & .tryToDouble() methods on [String]
- add .toBool() & .tryToBool() methods on [String]

## 1.0.1

- add .random() method on [int]
- add .random() & .randomOrNull() methods on [Set]

## 1.0.0

- Initial Release
    - add .random() & .randomOrNull() methods on [List]
