import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterbox/camera/camera_captured_photo_screen.dart';

import 'camera_loopback_screen.dart';

class CameraRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Camera Route'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                child: Text('Camera Loopback'),
                onPressed: () => showCameraLoopbackScreen(context),
              ),
              RaisedButton(
                child: Text('Capture Photo'),
                onPressed: () => showCapturedPhoto(context),
              )
            ],
          ),
        ));
  }

  // return type can be mentioned or not in case of void
  void showCameraLoopbackScreen(BuildContext context) async {
    // Ensure that plugin services are initialized so that availableCameras()
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CameraLoopbackScreen(cameraDescription: cameras[1])),
    );
  }

  showCapturedPhoto(BuildContext context) async {
    // Ensure that plugin services are initialized so that availableCameras()
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              CameraCapturedPhotoScreen(cameraDescription: cameras[0])),
    );
  }
}
