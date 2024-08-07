import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/services/encountersService.dart';

class EncountersPage extends StatefulWidget with NavigationStates {
  @override
  _EncountersPage createState() => _EncountersPage();
}

class _EncountersPage extends State<EncountersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.grey[850],
          centerTitle: true, // this is all you need
          title: Text(
            "Encounters",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(45, 20, 45, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              color: Colors.grey[600],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Encounter Type: ',
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
                          'Encounter Code: ',
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
                          'Encounter Detail: ',
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
                          'Encounter Priority: ',
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
                          'Encounter Notes: ',
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
