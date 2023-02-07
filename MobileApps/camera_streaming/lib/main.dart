import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late CameraController controller;
  int cameraIndex = 0;
  bool isStreaming = false;

  @override
  void initState() {
    super.initState();
    controller = CameraController(cameras[cameraIndex], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  startStream() {
    setState(() {
      isStreaming = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.traffic_rounded,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Live Camera Monitoring"),
            ],
          ),
      ),

      body: isStreaming
      ? Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 5.0),
            child: SizedBox(
              width: double.infinity,
              child: AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CameraPreview(controller),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: FloatingActionButton(
              // color: Colors.blue,
              onPressed: () {
                setState(() {
                  cameraIndex = cameraIndex == 0 ? 1 : 0;
                  controller = CameraController(cameras[cameraIndex], ResolutionPreset.medium);
                  controller.initialize().then((_) {
                    if (!mounted) {
                      return;
                    }
                    setState(() {});
                  });
                });
              },
              child: const Icon(
                Icons.cameraswitch_rounded,
              ),
            ),
          ),
        ],
      )
          : Center(
        child: ElevatedButton(
          onPressed: startStream,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.not_started_rounded,
              ),
              SizedBox(
                width: 20,
              ),
              Text("Start Stream"),
            ],
          ),
        ),
      ),
    );
  }
}
