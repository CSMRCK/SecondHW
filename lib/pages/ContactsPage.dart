import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:second/models/contacts.dart';
import 'package:second/models/save.dart';
import 'package:second/pages/ContactInfo.dart';

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
        body: Consumer<SaveData>(
          builder: (context, save, child) => (GroupedListView<dynamic, String>(
            elements: data,
            groupBy: (item) => item['group'],
            groupSeparatorBuilder: (groupValue) => Padding(
              padding: EdgeInsets.all(8),
              child: Text(groupValue),
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
                            color: (item['isFav']) == 'true'
                                ? Colors.blue[300]
                                : Colors.blue[100],
                            onPressed: () {
                              setState(() {
                                if (item['isFav'] == 'true') {
                                  item['isFav'] = 'false';
                                } else {
                                  item['isFav'] = 'true';
                                }
                              });
                            }),
                      ),
                      Expanded(
                          child: ListTile(
                        title: Text(
                          '${item['name']}' + ' ' + '${item['secondName']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[800]),
                        ),
                        leading: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return ContactInfo(
                                  index: item,
                                  contact: data,
                                );
                              }),
                            );
                          },
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/' + item['image']),
                          ),
                        ),
                        subtitle: Text(item['email']),
                      )),
                    ],
                  ),
                ],
              );
            },
            itemComparator: (item1, item2) =>
                item1['secondName'].compareTo(item2['secondName']),
            useStickyGroupSeparators: false,
            floatingHeader: false,
            order: GroupedListOrder.ASC,
          )),
        ));
  }
}
