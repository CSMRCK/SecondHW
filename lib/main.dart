import 'package:flutter/material.dart';
import 'ContactList.dart';

void main() {
  runApp(MyApp());
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
      home: MyHomePage(title: 'Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFavourite = false;

  // void _toggleFavourite() {
  //   setState(() {
  //     if (isFavourite) {
  //       isFavourite = false;
  //     } else {
  //       isFavourite = true;
  //     }
  //   });
  // }

  @override
  void initState() {
    contacts.sort((a, b) => a.name.compareTo(b.surname));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(18),
                    child: groupBy(index),
                  ),
                  Row(
                    children: [
                      Container(
                        child: new IconButton(
                            icon: Icon(Icons.star_rounded),
                            color: (contacts[index].isFavourite)
                                ? Colors.blue[300]
                                : Colors.transparent,
                            //onPressed: _toggleFavourite),
                            onPressed: () {
                              setState(() {
                                if (contacts[index].isFavourite) {
                                  contacts[index].isFavourite = false;
                                } else {
                                  contacts[index].isFavourite = true;
                                }
                              });
                            }),
                      ),
                      Expanded(
                          child: ListTile(
                        onTap: () {},
                        title: Text(
                          contacts[index].name + ' ' + contacts[index].surname,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800]),
                        ),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/${contacts[index].image}'),
                        ),
                        subtitle: Text(contacts[index].description),
                      )),
                    ],
                  ),
                ],
              );
            }));
  }
}

Text groupBy(int index) {
  Set<String> unique = {};
  var firstLetter = contacts[index].surname.toString().substring(0, 1);
  for (var i in contacts) {
    //var firstLetter = contacts[index].surname.toString().substring(0, 1);
    unique.add(firstLetter);
  }
  for (var item in unique) {}

  return Text(
    firstLetter,
    style: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 17, color: Colors.blueGrey[200]),
  );
}
