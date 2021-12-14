import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';

class Question extends StatelessWidget {
  const Question({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    CircleAvatar(radius: 25, backgroundImage: NetworkImage('${user?.photoURL}'));
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
              title: Text('Pergunta de hoje',
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: FutureBuilder<dynamic>(
                future: fetchQuestion(randomNumber()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!["Text"].toString(),
                        style: const TextStyle(
                            fontSize: 18.0, color: Color(0xff343a40)));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            TextField(
              // ignore: deprecated_member_use
              cursorColor: Theme.of(context).cursorColor,
              maxLength: 300,
              maxLines: 5,
              autofocus: false,
              decoration: const InputDecoration(
                constraints: BoxConstraints.tightFor(width: 300),
                isDense: true,
                filled: true,
                fillColor: Color(0xffced4da),
                labelText: 'Resposta',
                labelStyle: TextStyle(
                  color: Color(0xff2A2235),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff6c757d)),
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Question(),
                      ),
                    );
                  }, // Handle your callback.
                  splashColor: Colors.brown.withOpacity(0.5),
                  child: Ink(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/send.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }

  fetchQuestion(id) async {
    var url = Uri.parse(
        "https://o57o4uo693.execute-api.us-east-1.amazonaws.com/dev/question/${id}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
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
