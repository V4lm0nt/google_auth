import 'package:auth_app/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'auth_app',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          //backgroundColor: Colors.red,
          actions: [
            IconButton(
              onPressed: (){
                GoogleService.signOut();
              }, 
              icon: const Icon(FontAwesomeIcons.arrowRightFromBracket)
            )
          ],
          centerTitle: true,
          title: const Text('AuthApp Google-Apple'),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                MaterialButton(
                  splashColor: Colors.transparent,
                  minWidth: double.infinity,
                  height: 40,
                  color: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    await GoogleService.signInWithGoogle();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.google, color: Colors.white,),
                      Text('  Sign in with Google', style: TextStyle(color: Colors.white, fontSize: 17),)
                    ],
                  ),
                )

              ],
            ),
          ),
        )
      ),
    );
  }
}