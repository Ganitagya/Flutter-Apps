import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp(key: UniqueKey(),));

class MyApp extends StatefulWidget {
  MyApp({required Key key}) : super(key: key);

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
            Center(
              child: ElevatedButton(
                child: const Text('Open Brave Browser'),
                onPressed: () async {
                  setState(() {
                    _overlayVisible = !_overlayVisible;
                  });
                  var url = 'https://flutter.dev/';
                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false, forceWebView: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
              ),
            ),
            // InAppWebView(
            //   initialUrlRequest: URLRequest(
            //       url: Uri.parse("https://www.youtube.com/")
            //   ),
            // ),
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
