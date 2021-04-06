import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:second/models/save.dart';
import 'package:second/pages/ContactsPage.dart';

void main() {
  //runApp(MyApp());
  runApp(
      ChangeNotifierProvider(create: (context) => SaveData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blue[50],
      ),
      home: ContactsPage(),
    );
  }
}
