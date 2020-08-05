import 'package:http/http.dart' as http;
import 'dart:convert';

class Member {
  String dob;
  String memberFname;
  String memberLname;
  String memberMname;
  String memberFullName;
  String addFirstLine;
  String gender;
  String city;
  String state;
  String postalCode;
  String country;

  Future<dynamic> getMemberData() async {
    var url =
        'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Patient/1662?api_key=s7kccc6a2e69j4kqmv42dnhp';

    final response = await http.get(url);
    print('Response status Member: ${response.statusCode}');
    print('Response body: ${response.body}');

    var details = json.decode(response.body);
    dob = details["birthDate"];
    memberFname = details["name"][0]["given"][0];
    memberLname = "";
    // memberLname = details["last_name"];
    memberMname = "";
    // memberMname = details["middle_name"];
    addFirstLine = details["address"][0]["line"][0];
    gender = details["gender"];
    city = details["address"][0]["city"];
    state = details["address"][0]["state"];
    postalCode = details["address"][0]["postalCode"];
    country = details["address"][0]["country"];
  }

  String getDOB() {
    return dob;
  }

  String getMemberFname() {
    return memberFname;
  }

  String getMemberLname() {
    return memberLname;
  }

  String getMemberMname() {
    return memberMname;
  }

  String getMemberFullName() {
    return (memberFname + ' ' + memberMname + ' ' + memberLname);
  }

  String getAddFirstline() {
    return addFirstLine;
  }

  String getGender() {
    return gender;
  }

  String getCity() {
    return city;
  }

  String getState() {
    return state;
  }

  String getPostalCode() {
    return postalCode;
  }

  String getCountry() {
    return country;
  }
}
