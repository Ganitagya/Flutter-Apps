// This is used to get the list of all the available slots for booking appointment

import 'package:http/http.dart' as http;
import 'dart:convert';

// String location_id;
// String location_name;
// String location_contact;
// String location_address;
//
// String schedule_display;
// String scheduleplanningHorizonStart;
// String scheduleplanningHorizonEnd;
//
// String slotStart;
// String slotEnd;

String healthCenterName;
String healthCenterId;

List<Map> scheduleListForBookingAppointment = [];


class Schedule {
  Future<dynamic> getScheduleData() async {
    print('here');
    scheduleListForBookingAppointment.clear();


    var url_location = 'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Location?api_key=ydaxanuxpegmphgtuwapbzun&organization=1';
    final response_location = await http.get(url_location);

    // Only get the entry object from the parent object
    var locationEntryJson = List.from(jsonDecode(response_location.body)['entry']);
    healthCenterName = locationEntryJson[0]["resource"]["managingOrganization"]["display"];
    healthCenterId = locationEntryJson[0]['resource']['id'];

    var url =
        'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Slot?api_key=ydaxanuxpegmphgtuwapbzun&schedule=2605&_format=json';

    final response = await http.get(url);


    // Only get the entry object from the parent object
    var scheduleEntryJson = List.from(jsonDecode(response.body)['entry']);
    var data = jsonEncode(scheduleEntryJson);
    // var data = jsonEncode(response.body);

    print("\n========Inside Schedule Service=========\n");
    print(url);
    print("here");
    print(scheduleEntryJson);
    print("Encoder");
    print(data);

    for (var index = 0; index < scheduleEntryJson.length; index++){

      Map slot = {
        "status": scheduleEntryJson[index]["resource"]["status"],
        "date": scheduleEntryJson[index]["resource"]["start"].toString().substring(0, 10),
        "startTime": scheduleEntryJson[index]["resource"]["start"],
        "endTime": scheduleEntryJson[index]['resource']['end'],
        "healtcareCenterName": healthCenterName
      };
      print(slot);

      scheduleListForBookingAppointment.add(slot);
      // slot.clear();
    }
    print("The list of slots===========\n");
    print(scheduleListForBookingAppointment);

    print("\n========Completed loading Schedule Service=========\n");
  }
}


void setupSchedule() {
  scheduleListForBookingAppointment.clear();
  Schedule schedule =Schedule();
  schedule.getScheduleData();
}

void getHealthCenterDetails() async{
  var url = 'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Location?api_key=ydaxanuxpegmphgtuwapbzun&organization=1';
  final response = await http.get(url);

  // Only get the entry object from the parent object
  var scheduleEntryJson = List.from(jsonDecode(response.body)['entry']);
  healthCenterName = scheduleEntryJson[0]["resource"]["managingOrganization"]["display"];
  healthCenterId = scheduleEntryJson[0]['resource']['id'];
  print("Healthcare id: $healthCenterId");
  print("Name: $healthCenterName");
}