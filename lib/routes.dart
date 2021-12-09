// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teuday/home.dart';
import 'package:teuday/question.dart';

const String home = 'home';
const String question = 'question';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case home:
      return MaterialPageRoute(builder: (context) => Home());
    case question:
      return MaterialPageRoute(builder: (context) => Question());
    default:
      throw ('Erro!');
  }
}
