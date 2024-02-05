import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAv1bUSzz5T3gIIP4G1jEmVRTeO7PfT8Dk",
            authDomain: "ff-trivia.firebaseapp.com",
            projectId: "ff-trivia",
            storageBucket: "ff-trivia.appspot.com",
            messagingSenderId: "559350801427",
            appId: "1:559350801427:web:21cad71a3af202c234cbe6",
            measurementId: "G-79N3V9KGH3"));
  } else {
    await Firebase.initializeApp();
  }
}
