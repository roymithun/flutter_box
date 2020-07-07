import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class ToastRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Topic Toast"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Documentation'),
              Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: 'https://pub.dev/packages/fluttertoast',
              ),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FlutterToast.showToast(
                      msg: 'This is Long Toast',
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.grey,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                child: Text('Show Long Toast'),
              ),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FlutterToast.showToast(
                      msg: 'This is Short Toast',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.black,
                      backgroundColor: Colors.grey,
                      fontSize: 16.0);
                },
                child: Text('Show Short Toast'),
              ),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FlutterToast.showToast(
                      msg: 'This is Center Short Toast',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.grey,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                child: Text('Show Center Short Toast'),
              ),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FlutterToast.showToast(
                      msg: 'This is Top Short Toast',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.grey,
                      timeInSecForIosWeb: 1,
                      textColor: Colors.black,
                      fontSize: 16.0);
                },
                child: Text('Show Top Short Toast'),
              ),
              RaisedButton(
                onPressed: () {
                  // Navigate back to first route when tapped.
                  FlutterToast.showToast(
                      msg: 'This is Center Short Toast',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                },
                child: Text('Show Colored Short Toast'),
              ),
            ],
          ),
        ));

    return new Container(
      child: Linkify(
        onOpen: (link) async {
          if (await canLaunch(link.url)) {
            await launch(link.url);
          } else {
            throw 'Could not launch $link';
          }
        },
        text: 'https://pub.dev/packages/fluttertoast',
      ),
    );
    /*return Linkify(
      onOpen: (link) async {
        if (await canLaunch(link.url)) {
          await launch(link.url);
        } else {
          throw 'Could not launch $link';
        }
      },
      text: 'https://pub.dev/packages/fluttertoast',
    );*/
  }
}
