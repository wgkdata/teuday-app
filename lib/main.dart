import 'package:flutter/material.dart';
import 'package:teuday/question.dart';
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
                                  height: 200,
                                  width: 200,
                                ),

                                ButtonBar(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        final provider = Provider.of<GoogleSignInProvider>(context, listen:false);
                                        provider.googleLogin().then((data){
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ManageQuestion(),
                                            ),
                                          );
                                        });
                                      }, // Handle your callback.
                                      splashColor:
                                          Colors.brown.withOpacity(0.5),
                                      child: Ink(
                                        height: 80,
                                        width: 280,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                AssetImage('assets/login.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

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
