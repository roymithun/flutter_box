import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CapturePhotoScreen extends StatefulWidget {
  final CameraDescription cameraDescription;

  const CapturePhotoScreen({Key key, @required this.cameraDescription})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => CapturePhotoScreenState();
}

class CapturePhotoScreenState extends State<CapturePhotoScreen> {
  CameraController _cameraController;
  Future<void> _initializeControllerFuture;
  String imagePath;

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

  Future<void> takePicture(BuildContext context) async {
    await _initializeControllerFuture;

    // Construct the path where the image should be saved using the
    // pattern package.
    final path = join(
      // Store the picture in the temp directory.
      // Find the temp directory using the `path_provider` plugin.
      (await getTemporaryDirectory()).path,
      '${DateTime.now()}.png',
    );
    imagePath = path;
    // Attempt to take a picture and log where it's been saved.
    await _cameraController.takePicture(path);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DisplayPictureScreen(imagePath: path)));
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Capture Photo'),
      ),
      body: FutureBuilder(
          future: _initializeControllerFuture,
          builder: (buildContext, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.done) {
              return CameraPreview(_cameraController);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () => takePicture(context),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.

      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
