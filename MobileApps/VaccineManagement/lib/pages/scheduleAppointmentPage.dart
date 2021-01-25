import 'package:FHIR_Demo/services/scheduleAppointmentService.dart';
import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class SchedulePage extends StatefulWidget with NavigationStates {
  @override
  _SchedulePage createState() => _SchedulePage();
}

class _SchedulePage extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    print("Inside Scheduling page =========================");
    print(scheduleListForBookingAppointment);
    print("Inside Scheduling page =========================");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.blue[700],
          centerTitle: true, // this is all you need
          title: Text(
            "Available Vaccine Slots",
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 20, 20),
          child: Column(
            children: scheduleListForBookingAppointment.map((schedule) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.blue[600],
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [

                            Text(
                              schedule["healtcareCenterName"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),

                        SizedBox(
                          height: 8.0,
                        ),

                        Row(
                          children: [
                            Text(
                              "Date: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              schedule["date"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Text(
                              "Status: ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              schedule["status"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Quicksand',
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        FlatButton(
                          child: Text(
                            "Book Appointment",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Quicksand',
                            ),
                          ),
                          color: Colors.blue[900],
                          onPressed: () {

                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
