import 'package:flutter/material.dart';
import 'claim.dart';
import 'package:http/http.dart' as http;
import 'dialog.dart';
import 'dart:convert';

class ClaimCard extends StatelessWidget {
  final Claim claim;
  ClaimCard({this.claim});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow[200],
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Claim ID   -   ${claim.claim_id}',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[800]),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              'Claim Date - ${claim.date.toString()}',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 8.0,
            ),
            FlatButton.icon(
                //to get claim status
                onPressed: () async {
                  var url =
                      'https://integration.cloud.tibcoapps.com:443/ajnrcl7r2hunhwfmhxzxloquk6pycypr/bpm-state?caseref=' +
                          claim.claim_id;
                  final response = await http.get(url);
                  Map status = jsonDecode(response.body);

                  String body = 'Your Claim is currently in ' +
                      status['state'] +
                      ' state';

                  final action =
                      Dialogs.yesAbortDialog(context, claim.claim_id, body);
                },
                icon: Icon(Icons.touch_app),
                color: Colors.blue,
                label: Text(
                  'Click to Check Status',
                  style: TextStyle(fontSize: 14.0, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}

