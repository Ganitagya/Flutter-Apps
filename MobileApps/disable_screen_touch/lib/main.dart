import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _overlayVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Your Brave browser content goes here
            // ...
               InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse("https://www.youtube.com/")
                ),
              ),



            // Overlay
            if (_overlayVisible)
              Container(
                color: Colors.black54,
                child: const Center(
                  child: Text(
                    "Touch screen is disabled",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _overlayVisible = !_overlayVisible;
            });
          },
          child: Icon(
            _overlayVisible ? Icons.visibility_off : Icons.visibility,
          ),
        ),
      ),
    );
  }
}
