// ignore_for_file: unused_import, unused_local_variable

import 'package:flutter/material.dart';
import 'package:teuday/question.dart';
import 'routes.dart' as route;
import 'package:teuday/deprecated/home.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

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
              title: Text('Pergunta de hoje', style: TextStyle(fontSize: 18.0)),
            ),
            Container(
              child: FutureBuilder<dynamic>(
                future: fetchQuestion(randomNumber()),
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data!["Text"].toString()
                        ,style: const TextStyle(fontSize: 18.0));
                  }else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }
                  return const Center(child: CircularProgressIndicator(),);
                },
              ),
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

  fetchQuestion(id) async{
    var url = Uri.parse("https://o57o4uo693.execute-api.us-east-1.amazonaws.com/dev/question/${id}");
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      // print("{response.statusCode}");
      throw Exception("Não foi possível carregar a pergunta");
    }
  }

  int randomNumber() {
    var random = Random();

    int min = 1;

    int max = 23;

    int result = min + random.nextInt(max - min);

    return result;
  }
}
