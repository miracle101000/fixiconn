import 'dart:math';

import 'package:flutter/material.dart';

/// True height
double getHeight(double height, BuildContext context) {
  return (height / 812) * MediaQuery.of(context).size.height;
}

/// True width
getWidth(double width, BuildContext context) {
  return (width / 375) * MediaQuery.of(context).size.width;
}

extension StringExtensions on String {
  String capitalizeFirst() {
    if (isEmpty) {
      return this; // Or return an empty string "" if you prefer
    }
    return this[0].toUpperCase() + substring(1);
  }
}

String formatKMBTNumber(int number) {
  if (number < 1000) {
    return number.toString();
  }

  int orderOfMagnitude = (log(number) / log(1000)).floor();
  const suffixes = ['K', 'M', 'B', 'T'];

  double scaledNumber = number / pow(1000, orderOfMagnitude);

  return (scaledNumber % 1 == 0)
      ? '${scaledNumber.toInt()}${suffixes[orderOfMagnitude - 1]}'
      : '${scaledNumber.toStringAsFixed(1)}${suffixes[orderOfMagnitude - 1]}';
}
