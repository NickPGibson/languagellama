

import 'package:flutter/material.dart';

InputDecoration getInputDecoration({String? label, String? hintText}) => InputDecoration(
  hintText: hintText,
  labelText: label,
  labelStyle: const TextStyle(color: Colors.black),
  floatingLabelStyle:const TextStyle(color: Colors.black,),
  border: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.black
      )
  ),
  focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
          color: Colors.black
      )
  ),
);
