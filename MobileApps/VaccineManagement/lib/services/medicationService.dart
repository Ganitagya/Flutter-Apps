import 'package:http/http.dart' as http;
import 'dart:convert';

List<Map> medicationListForCard = [];

class Medication {
  Future<dynamic> getMedicationsData() async {
    //begin with a clean list
    medicationListForCard.clear();

    // var url =
    //     'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/MedicationRequest?api_key=ydaxanuxpegmphgtuwapbzun&patient=1662';
    //
    // final response = await http.get(url);

    // Only get the entry object from the parent object
    // var mediEntryJson = jsonDecode(response.body)['entry'];

    // if (mediEntryJson != null){
    //   print(mediEntryJson);
    //
    //   // Convert the array in json to array object
    //   List<Map> medications =
    //   mediEntryJson != null ? List.from(mediEntryJson) : null;
    //   medicationListForCard.clear();
    //
    //   print("Medication Length = \n ${medications.length} \n Endo");
    //   print(medicationListForCard.length);
    //   for (var i = 0; i < medications.length; i++) {
    //     print("\nloop$i\n");
    //     print(medications[i]["resource"]["status"]);
    //     print(medications[i]["resource"]["medicationCodeableConcept"]["coding"][0]
    //     ["display"]);
    //     Map mediDigest = {
    //       "MedicationName": medications[i]["resource"]
    //       ["medicationCodeableConcept"]["coding"][0]["display"],
    //       "MedicationStatus": medications[i]["resource"]["status"]
    //     };
    //     medicationListForCard.add(mediDigest);
    //   }
    // }


    //Uncomment till here and delete from here
        Map mediDigest = {
          "MedicationName": "MedicationName",
          "MedicationStatus": "MedicationStatus"
        };
        medicationListForCard.add(mediDigest);
      }
    }


void setupMedications() {
  Medication encounter = Medication();
  encounter.getMedicationsData();
}
