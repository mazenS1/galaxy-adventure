import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCc3zhYNx3MdUF2u-_MbOP9wjaYkKTJuoc",
            authDomain: "real-game-ms2gdo.firebaseapp.com",
            projectId: "real-game-ms2gdo",
            storageBucket: "real-game-ms2gdo.appspot.com",
            messagingSenderId: "248998679730",
            appId: "1:248998679730:web:63c6dfe815794454c265ab"));
  } else {
    await Firebase.initializeApp();
  }
}
