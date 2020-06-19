import 'dart:convert';
import 'dart:io';

import 'package:ecommerceapp/pages/dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'claim.dart';

class ClaimCard extends StatelessWidget {

  final Claim claim;
  ClaimCard({ this.claim});

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
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[800]
              ),
            ),
            SizedBox(height: 6.0,),

            Text(
              'Claim Date - ${claim.date.toString()}',
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600]
              ),
            ),
            SizedBox(height: 8.0,),

            FlatButton.icon(
              //to get claim status
                onPressed: () async {
                  var url = 'https://eu-west-1.integration.cloud.tibcoapps.com/o5rhzym76ouu52l7g3fx7cfi5i3f6h74/bpm-state?reference-dossier=' + claim.claim_id;
                  Response response = await get(url);
                  Map status = jsonDecode(response.body);

                  String body = 'Your Claim is currently in ' + status['state'] + ' state';

                  final action = Dialogs.yesAbortDialog(context, claim.claim_id, body);
                },
                icon: Icon(Icons.touch_app),
                color: Colors.blue,
                label: Text(
                  'Click to Check Status',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black
                  ),
                )
            )


          ],
        ),
      ),
    );
  }
}