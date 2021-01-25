import 'package:http/http.dart' as http;
import 'dart:convert';

String firstName;
String lastName;
String middleName;
String fullName;
String dateOfBirth;
String addFirstLine;
String gender;
String city;
String state;
String postalCode;
String country;
String email;
String memberId;

class Member {
  Future<dynamic> getMemberData() async {
    print("Inside Member service\n");
    var url =
        'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Patient/89?api_key=ydaxanuxpegmphgtuwapbzun';

    final response = await http.get(url);
    print('Response status Member: ${response.statusCode}');
    print('Response body: ${response.body}');

    var details = json.decode(response.body);

      dateOfBirth = details["birthDate"];
      firstName = details["name"][0]["given"][0];
      lastName = "";
      middleName = "";
      fullName = firstName + ' ' + middleName + ' ' + lastName;
      addFirstLine = details["address"][0]["line"][0];
      gender = details["gender"];
      city = details["address"][0]["city"];
      state = details["address"][0]["state"];
      postalCode = details["address"][0]["postalCode"];
      country = details["address"][0]["country"];
      email = details["telecom"][0]["value"];
      memberId = details["id"];

    //Uncomment till here and delete from here
    // dateOfBirth = "23 May 1973";
    // firstName = "Akash";
    // lastName = "Mahapatra";
    // middleName = "";
    // fullName = firstName + ' ' + middleName + ' ' + lastName;
    // addFirstLine = "Scottsdale";
    // gender = "Male";
    // city = "Phoenix";
    // state = "Arizona";
    // postalCode = "64723";
    // country = "USA";
    // email = 'email@email.com';
    // memberId = "12984";
  }
}

void setupMember() {
  Member member = Member();
  member.getMemberData();
}
