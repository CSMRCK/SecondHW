import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:second/models/save.dart';

class ContactInfo extends StatelessWidget {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final List<dynamic> contact;
  final dynamic index;

  ContactInfo({Key key, this.index, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Info'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (_key.currentState.validate()) {
                  _key.currentState.save();
                  context.read<SaveData>().saveData();
                  Navigator.pop(context);
                }
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircleAvatar(
                radius: 80.0,
                backgroundColor: Colors.blue[500],
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/${index['image']}'),
                  radius: 76.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'First name',
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 0, top: 0),
                            child: Icon(Icons.face,
                                color: Colors.blue[500], size: 35.0),
                          )),
                      maxLength: 30,
                      initialValue: index['name'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (text) {
                        index['name'] = text;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Second name',
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 0, top: 0),
                            child: Icon(Icons.fact_check,
                                color: Colors.blue[500], size: 35.0),
                          )),
                      maxLength: 30,
                      initialValue: index['secondName'],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onSaved: (text) {
                        index['secondName'] = text;
                      },
                      validator: (text) =>
                          text.isEmpty ? 'Enter Last name' : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Phone number',
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 0, top: 0),
                            child: Icon(Icons.phone_android_outlined,
                                color: Colors.blue[500], size: 35.0),
                          )),
                      maxLength: 13,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      initialValue: '+38' + index['phone'],
                      onSaved: (input) {
                        index['phone'] = input;
                      },
                      validator: (input) => input.isEmpty || input.length < 13
                          ? 'Please, enter valid phone number'
                          : null,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email or company name',
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(
                                start: 0, top: 0),
                            child: Icon(Icons.email,
                                color: Colors.blue[500], size: 35.0),
                          )),
                      initialValue: index['email'],
                      onSaved: (input) {
                        index['email'] = input;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Bio(notes)',
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 0, top: 0),
                          child: Icon(Icons.info,
                              color: Colors.blue[500], size: 35.0),
                        ),
                      ),
                      minLines: 1,
                      maxLines: 5,
                      initialValue: index['bio'],
                      onSaved: (input) {
                        index['bio'] = input;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
