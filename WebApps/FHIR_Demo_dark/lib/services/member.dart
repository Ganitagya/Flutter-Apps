import 'package:http/http.dart' as http;
import 'dart:convert';

class Member {
  String dob;
  String memberFname;
  String memberLname;
  String memberMname;
  String memberFullName;

  Future<dynamic> getMemberData() async {
    var url =
        'https://integration.cloud.tibcoapps.com:443/4hzvlzzwbj2p5mmfdo6z7i646rovcmqa/members/123456';

    final response = await http.get(url);
    print('Response status Member: ${response.statusCode}');
    print('Response body: ${response.body}');

    var details = json.decode(response.body);
    dob = details["dob"];
    memberFname = details["first_name"];
    memberLname = details["last_name"];
    memberMname = details["middle_name"];
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
}
