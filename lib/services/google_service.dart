import 'package:google_sign_in/google_sign_in.dart';

class GoogleService{



  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
     'email',
    ],
  );

  GoogleService();


  static Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if(account == null) return null;

      final googleKey = await account.authentication;

      print(account);
      print('======= ID TOKEN =======');
      print(googleKey.idToken);

      //TODO: llamar un servicio REST a nuestro backend 
      // con el ID Token

      return account;

    } catch (e) {

      print('Error en Google SignIn');
      print(e);
      return null;
    }
  }

  static Future signOut() async{

    _googleSignIn.signOut();

  }


}