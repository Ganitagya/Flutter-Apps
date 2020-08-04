import 'package:http/http.dart' as http;
import 'dart:convert';

class Member {
  String memberFname;
  String memberMname;
  String memberLname;

  String dob;

  Member() {
    getMemberDetails();
  }

  void getMemberDetails() async {
    var url =
        'https://integration.cloud.tibcoapps.com:443/4hzvlzzwbj2p5mmfdo6z7i646rovcmqa/members/123456';

    final response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    var details = json.decode(response.body);
    dob = details["dob"];
    memberFname = details["first_name"];
    memberLname = details["last_name"];
    memberMname = details["middle_name"];
  }

  String getDateofBirth() {
    return dob;
  }

  String getfName() {
    return memberFname;
  }

  String getName() {
    // getname();
    return memberFname + ' ' + memberMname + ' ' + memberLname;
  }
}
