import 'package:flutter/material.dart';
import 'package:FHIR_Demo/services/member.dart';
import 'package:FHIR_Demo/data/memberData.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String dob;
  // String memberFname;
  String memberLname;
  String memberMname;
  String memberFullName;

  void setupMember() async {
    Member member = Member();
    await member.getMemberData();
    dateOfBirth = member.getDOB();
    firstName = member.getMemberFname();
    lastName = member.getMemberLname();
    middleName = member.getMemberMname();
    fullName = member.getMemberFullName();
  }

  @override
  void initState() {
    super.initState();
    print("======================================================");
    setupMember();
    print('end of loading');
    print("======================================================");
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Loading screen'),
          RaisedButton(
            onPressed: () {
              print("in onpressed");
              print(firstName);
              Navigator.pushReplacementNamed(context, '/memberhome',
                  arguments: {
                    'dob': dob,
                    'firstName': firstName,
                    'middleName': memberMname,
                    'lastName': memberLname,
                    'fullName': memberFullName,
                  });
            },
          )
        ],
      ),
    );
  }
}
