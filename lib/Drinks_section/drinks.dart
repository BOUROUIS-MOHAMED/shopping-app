import 'dart:math';

import 'package:flutter/cupertino.dart';

double _doubleInRangle(Random source,num start,num end)
=>source.nextDouble()*(end-start) +1;
final random = Random();
final drinks=List.generate(_names.length,
        (index) => Drink(
          image:'assets/drinks/${index+1}.png',
          name:_names[index],
          price:_doubleInRangle(random, 3, 7),
        )
);
class Drink{
  Drink({
    required this.name,
    required this.image,
    required this.price,
});
  final String name;
  final String image;
  final double price;
}

final _names = [
  "first drink",
  "second drink to test overflow",
  "third drink",
  'forth drink',
  "five drink",
  "six drink",
  "seven drink",
  "eighth drink ",
  "nine drink",
  "ten drink",
  "eleven drink",
  "twelve drink",
  "thirteen drink"
];
