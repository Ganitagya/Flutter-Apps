import 'package:http/http.dart' as http;
import 'dart:convert';

String encounterCode;
String encounterType;
String encounterTypeDetail;
String encounterTypePriority;
String encounterNotes;

class Encounter {
  Future<dynamic> getEncounterData() async {
//     var url =
// 'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Encounter/838?api_key=ydaxanuxpegmphgtuwapbzun';
//     final response = await http.get(url);
    // print('Response status Encounters: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // var details = json.decode(response.body);

    // encounterCode = details["class"]["code"];
    // encounterType = details["class"]["display"];
    // encounterTypeDetail = details["type"][0]["coding"][0]["display"];
    // encounterTypePriority = details["priority"]["coding"][0]["display"];
    // encounterNotes = details["reasonCode"][0]["text"];
    // print("note $encounterNotes");

    //Uncomment till here and delete from here
    encounterCode = "Vaccination Code";
    encounterType = "Vaccination Type";
    encounterTypeDetail = "Vaccination Details";
    encounterTypePriority = 'Normal';
    encounterNotes = "Any notes provided by the doctor while vaccinating";

  }
}

void setupEncounters() {
  Encounter encounter = Encounter();
  encounter.getEncounterData();
}
