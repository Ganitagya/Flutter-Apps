import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/services/encountersService.dart';
import 'package:FHIR_Demo/services/vaccineService.dart';

class VaccineRecordsPage extends StatefulWidget with NavigationStates {
  @override
  _VaccineRecordsPage createState() => _VaccineRecordsPage();
}

class _VaccineRecordsPage extends State<VaccineRecordsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.blue[700],
          centerTitle: true, // this is all you need
          title: Text(
            "Vaccine Records",
          ),
        ),
      ),

      body: Visibility(
        visible: vaccineDone == 1,
        child: Padding(

          padding: const EdgeInsets.fromLTRB(45, 20, 45, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                color: Colors.blue[600],
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Type: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            encounterType,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Code: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            encounterCode,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Details: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            encounterTypeDetail,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Priority: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            encounterTypePriority,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Vaccination Notes: ',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Quicksand',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              encounterNotes,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        color: Colors.blue[800],
                        child: Text(
                          "Feedback",
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.normal,
                            // decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: (){

                          showDialog(context: context,
                              builder: (context){
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),

                                  ),
                                  child: Container(
                                    height: 300,
                                    child: Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Feedback Form",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'Quicksand',
                                                decoration: TextDecoration.underline,
                                                fontWeight: FontWeight.bold
                                            ),),
                                          SizedBox(height: 20,),
                                          Text("Do you face any after effects ?",
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Quicksand',

                                          ),),

                                          SizedBox(height: 20,),

                                        TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter feedback here'
                                          ),
                                        ),
                                      SizedBox(height: 20.0,),
                                          SizedBox(
                                            width: 220,
                                            child: RaisedButton(
                                              color: Colors.blue[700],
                                              onPressed: (){

                                                Navigator.pop(context);
                                              },
                                              child: Text("Submit",
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white
                                                ),),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
