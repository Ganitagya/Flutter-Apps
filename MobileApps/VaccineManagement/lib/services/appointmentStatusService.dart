// This service is used to get the status of the appointment
// If the appointment is booked or pending

import 'package:http/http.dart' as http;
import 'dart:convert';

String appointmentStatus = 'pending';

//
// class AppointmentStatus {
//   Future<dynamic> getScheduleData() async {
//     var url = 'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Appointment?api_key=ydaxanuxpegmphgtuwapbzun';
//     final response = await http.get(url);
//
//     // Only get the entry object from the parent object
//     var StatusEntryJson = List.from(jsonDecode(response.body)['entry']);
//     appointmentStatus = StatusEntryJson[0]["resource"]["status"];
//
//     print(appointmentStatus);
//   }
// }

Future<String> getAppointmentStatus() async {
  var url = 'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Appointment?api_key=ydaxanuxpegmphgtuwapbzun';
    final response = await http.get(url);

    // Only get the entry object from the parent object
    var StatusEntryJson = List.from(jsonDecode(response.body)['entry']);
    appointmentStatus = StatusEntryJson[0]["resource"]["status"];
  return appointmentStatus;
}
