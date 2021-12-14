// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'routes.dart' as route;
import 'package:teuday/question.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../src/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teuday/google_login.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context)=> ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Generated App',
      theme: ThemeData(
        primaryColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFF404040),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: const Color(0xFF2196f3)),
      ),
      home: MyHomePage(),
    )
  );
  }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/TeuDay.png',
                                  height: 100,
                                  width: 100,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                                    provider.googleLogin().then((data){
                                      Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                          builder: (context) => const Question(),
                                        ),
                                      );
                                    });
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 23.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Roboto"),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            const Color(0xFFff7f00)),
                                  ),
                                )
                              ])
                        ])
                  ])
            ]),
        padding: const EdgeInsets.all(0.0),
        alignment: Alignment.center,
      ),
  );
  }
}
