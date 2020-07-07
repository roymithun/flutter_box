import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceRoute extends StatelessWidget {
  final inputTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Topic Shared Preferences"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 200.0,
                  child: TextField(
                    controller: inputTextController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter some value'),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  _doSave();
                },
                child: Text('Save'),
              ),
            ],
          ),
          RaisedButton(
            onPressed: () {
              _doFetch(context);
            },
            child: Text('Fetch'),
          ),
        ],
      )),
    );
  }

  _doSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = inputTextController.text;
    await prefs.setString('my_key', value);
    print('Saved Val: $value');
  }

  _doFetch(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var fetchedVal = prefs.getString('my_key');
    print('Fetched Val: $fetchedVal');

    await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fetched Value!'),
          content: Text('You saved "$fetchedVal".'),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
