import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'ContactList.dart';
import 'contact.dart';

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
      home: ContactsPage(),
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
                                : Colors.blue[100],
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

  String firstLetter(int index) {
    var firstLetter = contacts[index].surname.toString().substring(0, 1);
    return firstLetter;
  }

  Text groupBy(int index) {
    var firstLetter = contacts[index].surname.toString().substring(0, 1);

    return Text(
      firstLetter,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 17,
          color: Colors.blueGrey[200]),
    );
  }

  Text finalResult(int index) {
    if (--index >= 0) {
      return groupBy(index);
    } else
      return Text('');
  }
}

List data = [
  {
    "id": 1,
    "name": "Elma",
    "secondName": "Herring",
    "group": "H",
    "email": "elmaherring@unq.com",
    "phone": "+1 (913) 497-2020",
    'image': 'anacletus.png',
    'isFav': false
  },
  {
    "id": 2,
    "name": "Knapp",
    "secondName": "Berry",
    "group": "B",
    "email": "knappberry@unq.com",
    "phone": "+1 (951) 472-2967",
    'image': 'delphine.png',
    'isFav': false
  },
  {
    "id": 3,
    "name": "Bell",
    "secondName": "Burgess",
    "group": "B",
    "email": "bellburgess@unq.com",
    "phone": "+1 (887) 478-2693",
    'image': 'evan.png',
    'isFav': false
  },
  {
    "id": 4,
    "name": "Hobbs",
    "secondName": "Ferrell",
    "group": "F",
    "email": "hobbsferrell@unq.com",
    "phone": "+1 (862) 581-3022",
    'image': 'helena.png',
    'isFav': false
  },
  {
    "id": 5,
    "name": "Marylou",
    "secondName": "Medina",
    "group": "M",
    "email": "maryloumedina@unq.com",
    "phone": "+1 (996) 520-2967",
    'image': 'default.png',
    'isFav': false
  },
  {
    "id": 6,
    "name": "Larson",
    "secondName": "Guerra",
    "group": "G",
    "email": "larsonguerra@unq.com",
    "phone": "+1 (972) 566-2684",
    'image': 'delphine.png',
    'isFav': false
  },
  {
    "id": 7,
    "name": "Shelby",
    "secondName": "Ballard",
    "group": "B",
    "email": "shelbyballard@unq.com",
    "phone": "+1 (824) 467-3579",
    'image': 'anacletus.png',
    'isFav': false
  },
  {
    "id": 8,
    "name": "Lea",
    "secondName": "Faulkner",
    "group": "F",
    "email": "leafaulkner@unq.com",
    "phone": "+1 (899) 528-3402",
    'image': 'default.png',
    'isFav': false
  },
  {
    "id": 9,
    "name": "Cecelia",
    "secondName": "Wolf",
    "group": "W",
    "email": "ceceliawolf@unq.com",
    "phone": "+1 (862) 507-3140",
    'image': 'anacletus.png',
    'isFav': false
  },
  {
    "id": 10,
    "name": "Melva",
    "secondName": "Nixon",
    "group": "N",
    "email": "melvanixon@unq.com",
    "phone": "+1 (901) 444-3081",
    'image': 'default.png',
    'isFav': false
  },
  {
    "id": 11,
    "name": "Bernard",
    "secondName": "Chambers",
    "group": "C",
    "email": "bernardchambers@unq.com",
    "phone": "+1 (831) 539-3366",
    'image': 'delphine.png',
    'isFav': false
  }
];

class ContactsPage extends StatefulWidget {
  ContactsPage({Key key}) : super(key: key);

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacts'),
        ),
        body: GroupedListView<dynamic, String>(
          elements: data,
          groupBy: (item) => item['group'],
          groupSeparatorBuilder: (groupValue) => Padding(
            padding: EdgeInsets.all(8),
            child: Text('${groupValue}'),
          ),
          itemBuilder: (context, item) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: new IconButton(
                          icon: Icon(Icons.star_rounded),
                          color: (item['isFav']) == true
                              ? Colors.blue[300]
                              : Colors.blue[100],
                          onPressed: () {
                            setState(() {
                              if (item['isFav']) {
                                item['isFav'] = false;
                              } else {
                                item['isFav'] = true;
                              }
                            });
                          }),
                    ),
                    Expanded(
                        child: ListTile(
                      onTap: () {},
                      title: Text(
                        '${item['name']}' + ' ' + '${item['secondName']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[800]),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/${item['image']}'),
                      ),
                      subtitle: Text('${item['email']}'),
                    )),
                  ],
                ),
              ],
            );
          },
          //groupComparator: (group1, group2) => group1.compareTo(group2),
          itemComparator: (item1, item2) =>
              item1['secondName'].compareTo(item2['secondName']),
          useStickyGroupSeparators: false,
          floatingHeader: false,
          order: GroupedListOrder.ASC,
        ));
  }
}
