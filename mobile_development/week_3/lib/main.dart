import 'package:flutter/material.dart';
import 'splash_page.dart';
import 'const.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weekly DSC",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: kPrimaryColor,
      ),
      home: SplashPage(),
    );
  }
  //TODO 1: Tambahkan aplikasi ke firebase
  //TODO 2: Tambahkan library firebase
  //TODO 3: Tambahkan data ke firebase
  //TODO 4: Ubah HomePage agar dapat menarik data dari firebase menggunakan stream builder query snapshot.
  //TODO 5: Tambahkan page baru bernama add_page.dart
  //TODO 6: Desain Page tersebut untuk pertemuan berikutnya
}
