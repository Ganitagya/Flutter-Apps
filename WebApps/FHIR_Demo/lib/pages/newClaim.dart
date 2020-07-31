import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'dart:convert';
import 'claim.dart';
import 'claims_list.dart';
import 'dialog.dart';

class MyNewClaim extends StatelessWidget with NavigationStates {
  String nom;
  String prenom;
  String numero_adherent;
  String type_accident;
  String duree_en_jour;

  void submitClaim(context, nom, prenom, numero_adherent, type_accident,
      duree_en_jour) async {
    //make the request
    var url =
        'http://emeapresalessouth.api.mashery.com/v1/indemnisation?api_key=qvxw247r2usw3bjbmf24hxed';
    var payload = {
      "numero-adherent": numero_adherent,
      "nom": nom,
      "prenom": prenom,
      "type-accident": type_accident,
      "duree-en-jour": int.parse(duree_en_jour)
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

    Claim claim = new Claim(claim_id: caseRef["reference-dossier"]);
    insert_to_claims_list(claim);

    String body = 'Your Claim has been placed successfully \n Claim Id : ' +
        caseRef["reference-dossier"];
    final action =
        Dialogs.yesAbortDialog(context, "Claim Registered Successfully", body);
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'lastName'), //nom
      validator: (String value) {
        if (value.isEmpty) {
          return 'Le nom est requis';
        }

        return null;
      },
      onSaved: (String value) {
        nom = value;
      },
    );
  }

  Widget _buildPrenom() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'firstName'), //prenom
      validator: (String value) {
        if (value.isEmpty) {
          return 'Le prenom est requis';
        }
        return null;
      },
      onSaved: (String value) {
        prenom = value;
      },
    );
  }

  Widget _buildnumero_adherent() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'member-number'), //numero-adherent
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        numero_adherent = value;
      },
    );
  }

  Widget _buildtype_accident() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'type-accident'),
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
          InputDecoration(labelText: 'duration in hour'), //duree_en_jour
      validator: (String value) {
        return null;
      },
      onSaved: (String value) {
        duree_en_jour = value;
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

                    print(nom);
                    print(prenom);
                    print(numero_adherent);
                    print(type_accident);
                    print(duree_en_jour);

                    //Send to API
                    submitClaim(context, nom, prenom, numero_adherent,
                        type_accident, duree_en_jour);
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

