import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBS5FOQIFHVFwg04W6VaYGczawbPoPqjf4",
            authDomain: "ejemplouno-1d979.firebaseapp.com",
            projectId: "ejemplouno-1d979",
            storageBucket: "ejemplouno-1d979.firebasestorage.app",
            messagingSenderId: "107081790542",
            appId: "1:107081790542:web:2eaea75e537377547c7f1f",
            measurementId: "G-2XCY1LWH81"));
  } else {
    await Firebase.initializeApp();
  }
}
