// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:teuday/question.dart';

const String question = 'question';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case question:
      return MaterialPageRoute(builder: (context) => ManageQuestion());
    default:
      throw ('Erro!');
  }
}
