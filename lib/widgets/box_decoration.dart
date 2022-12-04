

import 'package:flutter/material.dart';

BoxDecoration getBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      colors: [
        Colors.deepPurple,
        Colors.deepPurple[500]!,
        Colors.deepPurple[600]!,
        // Colors.deepPurple[700]!
      ]
    ));
