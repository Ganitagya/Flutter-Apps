import 'package:http/http.dart' as http;
import 'dart:convert';

String docName;
String apiKey;
bool checkMale = false;
bool checkFemale = false;
String location = '';

List<Map> searchedDoctorsList = [];

class Search {
  Future<dynamic> getSearchResults() async {
    print("Search dervice invoked");
    apiKey = "s7kccc6a2e69j4kqmv42dnhp";
    var url =
        "http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Practitioner?api_key=$apiKey&name=$docName";

    print("Inside search service=========");
    print("The URL : $url");
    final response = await http.get(url);
    // print('Response status Encounters: ${response.statusCode}');
    // print('Response body: ${response.body}');
    var doctorsJson = jsonDecode(response.body)['entry'];
    print(doctorsJson);

    // Convert the array in json to array object
    List<Map> doctors = doctorsJson != null ? List.from(doctorsJson) : null;
    searchedDoctorsList.clear();
    print(doctors.length);
    print(searchedDoctorsList.length);

    // Check if location is provided
    if (location != '') {
      print("Checking if Male or female");
      print("Male selected : $checkMale");
      print("Female selected : $checkFemale");

      // If both check boxes are ticked
      if (checkFemale && checkMale) {
        print("both check boxes are ticked");

        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["address"][0]["city"] == location) {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      } else if (checkFemale && !checkMale) {
        // only Female checked
        print("only Female checked");
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["gender"] == "male" &&
              doctors[i]["resource"]["address"][0]["city"] == location) {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      } else if (!checkFemale && checkMale) {
        // only Male checked
        print("only Male checked");
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["gender"] == "female" &&
              doctors[i]["resource"]["address"][0]["city"] == location) {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      } else {
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["address"][0]["city"] == location) {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      }
    } else {
      print("Checking if Male or female");
      print("Male selected : $checkMale");
      print("Female selected : $checkFemale");

      // If both check boxes are ticked
      if (checkFemale && checkMale) {
        print("both check boxes are ticked");
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          Map docDigest = {
            "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
            "givenName": doctors[i]["resource"]["name"][0]["given"][0],
            "familyName": doctors[i]["resource"]["name"][0]["family"],
            "gender": doctors[i]["resource"]["gender"],
            "phone": doctors[i]["resource"]["telecom"][0]["value"],
            "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
            "city": doctors[i]["resource"]["address"][0]["city"],
            "state": doctors[i]["resource"]["address"][0]["state"],
            "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
          };
          searchedDoctorsList.add(docDigest);
        }
      } else if (checkFemale && !checkMale) {
        // only Female checked
        print("only Female checked");
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["gender"] == "male") {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      } else if (!checkFemale && checkMale) {
        // only Male checked
        print("only Male checked");
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          if (doctors[i]["resource"]["gender"] == "female") {
            Map docDigest = {
              "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
              "givenName": doctors[i]["resource"]["name"][0]["given"][0],
              "familyName": doctors[i]["resource"]["name"][0]["family"],
              "gender": doctors[i]["resource"]["gender"],
              "phone": doctors[i]["resource"]["telecom"][0]["value"],
              "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
              "city": doctors[i]["resource"]["address"][0]["city"],
              "state": doctors[i]["resource"]["address"][0]["state"],
              "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
            };
            searchedDoctorsList.add(docDigest);
          }
        }
      } else {
        for (var i = 0; i < doctors.length; i++) {
          // print("\nloop$i\n");
          // print(doctors[i]["resource"]["id"]);
          // print(doctors[i]["resource"]["name"][0]["given"][0]);
          Map docDigest = {
            "suffix": doctors[i]["resource"]["name"][0]["suffix"][0],
            "givenName": doctors[i]["resource"]["name"][0]["given"][0],
            "familyName": doctors[i]["resource"]["name"][0]["family"],
            "gender": doctors[i]["resource"]["gender"],
            "phone": doctors[i]["resource"]["telecom"][0]["value"],
            "addFirstLine": doctors[i]["resource"]["address"][0]["line"][0],
            "city": doctors[i]["resource"]["address"][0]["city"],
            "state": doctors[i]["resource"]["address"][0]["state"],
            "postalCode": doctors[i]["resource"]["address"][0]["postalCode"],
          };
          searchedDoctorsList.add(docDigest);
        }
      }
    }

    print("Returning from search");
  }
}

Future<dynamic> searchDoctors(String locationOfDoctor) async {
  docName = "";
  location = locationOfDoctor;
  Search doctor = Search();
  await doctor.getSearchResults();
  print("Here is a list of searched doctors");
  print(searchedDoctorsList);
  return;
}
