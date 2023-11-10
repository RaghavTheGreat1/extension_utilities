<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A library of extension utils on existing dart core.

## Features


### - String:
    - toInt()
    - tryToInt()
    - toDouble()
    - tryToDouble()
    - toBool()
    - tryToBool()


### - List:
    - random()
    - randomOrNull()

## Getting started

In your flutter/dart project add the dependency:


```yaml
extension_utilities:
```


Import the package

```dart
import 'package:extension_utilities/extension_utilities.dart';

final fruits = ["mango", "banana", "orange"];
print(fruits.random());
```



