// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:teuday/question.dart';
import 'routes.dart' as route;
import 'package:teuday/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/constants.dart';

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 350,
      height: 480,
      padding: const EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.grey,
        elevation: 9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              title: Text('Pergunta De Hoje', style: TextStyle(fontSize: 18.0)),
              subtitle: Text('Aqui vai a perguntinha do dia',
                  style: TextStyle(fontSize: 18.0)),
            ),
            TextField(
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              maxLength: 300,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Resposta',
                labelStyle: TextStyle(
                  color: Color(0xff2A2235),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff2A2235)),
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Salvar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
