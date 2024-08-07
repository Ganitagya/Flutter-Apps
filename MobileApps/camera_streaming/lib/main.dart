import 'package:camera_streaming/signaling.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:google_fonts/google_fonts.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.orange,
      textTheme: GoogleFonts.latoTextTheme(),
      scaffoldBackgroundColor: Colors.orange[100],
    ),
    home: const MyApp(),
  ));

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Signaling signaling = Signaling();
  final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  late CameraController controller;
  int cameraIndex = 0;
  bool isStreaming = false;

  @override
  void initState() {

    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });


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
    _localRenderer.dispose();
    _remoteRenderer.dispose();

    controller.dispose();
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
            children:  const [
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
          // const SizedBox(
          //   height: 20,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            child: SizedBox(
              height: 550,
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
