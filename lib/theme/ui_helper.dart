import 'package:flutter/material.dart';

List<BoxShadow> getBoxShadow(Color color) {
  return [
    BoxShadow(
      blurRadius: 5,
      color: color.withValues(alpha: 0.6),
    ),
  ];
}
