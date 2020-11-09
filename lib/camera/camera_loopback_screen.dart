import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraLoopbackScreen extends StatefulWidget {
  final CameraDescription cameraDescription;

  const CameraLoopbackScreen({Key key, @required this.cameraDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CameraLoopbackScreenState();
}

class CameraLoopbackScreenState extends State<CameraLoopbackScreen> {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // To display the current output from the camera,
    // create a CameraController.
    _cameraController = CameraController(
        // Get a specific camera from the list of available cameras.
        widget.cameraDescription,
        // Define the resolution to use.
        ResolutionPreset.high);

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _cameraController.initialize();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        FutureBuilder(
            future: _initializeControllerFuture,
            builder: (buildContext, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        Container(
            margin: EdgeInsets.only(left: 30.0, top: 70.0),
            width: 120,
            height: 160,
            child: FutureBuilder(
                future: _initializeControllerFuture,
                builder: (buildContext, asyncSnapshot) {
                  if (asyncSnapshot.connectionState == ConnectionState.done) {
                    return CameraPreview(_cameraController);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })),
      ],
    );
  }
}
