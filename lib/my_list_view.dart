import 'package:flutter/material.dart';
import 'package:flutterbox/camera/topic_camera.dart';
import 'package:flutterbox/topic_notifications.dart';
import 'package:flutterbox/topic_shared_prefs.dart';
import 'package:flutterbox/topic_tab_bar.dart';
import 'package:flutterbox/topic_toast.dart';

Widget myListView(BuildContext context) {
  final topics = [
    'Toast',
    'Shared Preferences',
    'Notifications',
    'Tab Bar',
    'Camera',
    // TODO list below
    'Network Info',
    'Define Custom Color'
  ];
  return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (buildContext, index) {
        var topic = topics[index];
        return Card(
          color: Color(0xFFC7E8F3),
          child: ListTile(
            title: Text(topic),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Widget route;
              switch (topic) {
                case 'Toast':
                  route = ToastRoute();
                  break;
                case 'Shared Preferences':
                  route = SharedPreferenceRoute();
                  break;
                case 'Notifications':
                  route = NotificationRoute();
                  break;
                case 'Tab Bar':
                  route = TabBarRoute();
                  break;
                case 'Camera':
                  route = CameraRoute();
                  break;
                default:
                  route = null;
              }
              if (route != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => route),
                );
              }
            },
          ),
        );
      });
}
