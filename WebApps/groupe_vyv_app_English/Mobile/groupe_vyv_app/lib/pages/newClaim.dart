import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'dart:convert';
import 'claim.dart';
import 'claims_list.dart';
import 'dialog.dart';

class MyNewClaim extends StatelessWidget with NavigationStates {
  String Lastname;
  String Firstname;
  String customerid;
  String type_accident;
  String noofdays;

  void submitClaim(context, nom, prenom, numero_adherent, type_accident,
      duree_en_jour) async {
    //make the request
    var url =
        'https://integration.cloud.tibcoapps.com:443/gf4kse4buc6v5ejadazqw5jh5nsi3hnz/claim';
    var payload = {
       
        "customerid": customerid,
        "LastName": Lastname,
        "FirstName": Firstname,
        "Type Of Accident": type_accident,
        "No of Days": int.parse(noofdays)
     
    };

    final response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: json.encode(payload));

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var caseRef = json.decode(response.body);
    print(caseRef["reference-dossier"]);

    Claim claim = new Claim(claim_id: caseRef["CaseReference"]);
    insert_to_claims_list(claim);

    String body = 'Your Claim has been placed successfully \n Claim Id : ' +
        caseRef["CaseReference"];
    final action =
        Dialogs.yesAbortDialog(context, "Claim Registered Successfully", body);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'LastName'), //nom
      validator: (String value) {
        if (value.isEmpty) {
          return 'Lastname is required';
        }

        return null;
      },
      onSaved: (String value) {
        Lastname = value;
      },
    );
  }

  Widget _buildPrenom() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'FirstName'), //prenom
      validator: (String value) {
        if (value.isEmpty) {
          return 'First name is required';
        }
        return null;
      },
      onSaved: (String value) {
        Firstname = value;
      },
    );
  }

  Widget _buildnumero_adherent() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'CustomerID'), //numero-adherent
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        customerid = value;
      },
    );
  }

  Widget _buildtype_accident() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Type Of Accident'),
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        type_accident = value;
      },
    );
  }

  Widget _builduree_en_jour() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Duration in Days '), //duree_en_jour
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        noofdays = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Nouvelle réclamation"),
        title: Text("New Claim"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100.0,
                ),
                _buildPrenom(),
                _buildName(),
                _buildnumero_adherent(),
                _buildtype_accident(),
                _builduree_en_jour(),
                SizedBox(height: 100),
                RaisedButton(
                  child: Text(
                    'submit',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();

                    print(Lastname);
                    print(Firstname);
                    print(customerid);
                    print(type_accident);
                    print(noofdays);

                    //Send to API
                    submitClaim(context, Lastname, Firstname, customerid,
                        type_accident, noofdays);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

