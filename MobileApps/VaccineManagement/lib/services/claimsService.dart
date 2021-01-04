import 'package:http/http.dart' as http;
import 'dart:convert';

String claimPriority;
String doctorReference;
String claimCoverageId;
String claimServiceDate;
double claimAmount;
double claimAdjudicatedAmount;
double claimOutOfPocket;

class Claim {
  Future<dynamic> getClaimsData() async {
    // var url =
    //     'http://healthcareinteroperability.api.mashery.com/hapi-fhir-jpaserver/fhir/Claim/841?api_key=z4ytu26y9d7exzk9dgpqasbs';
    //
    // final response = await http.get(url);
    // print('Response status Claims: ${response.statusCode}');
    // print('Response body: ${response.body}');
    // var details = json.decode(response.body);

  // if (details != null){
  //     print("Printing claim details======");
  //     print(details);
  //
  //     claimPriority = details["priority"]["coding"][0]["code"];
  //     doctorReference = details["careTeam"][0]["provider"]["reference"];
  //     claimCoverageId = details["insurance"][0]["coverage"]["reference"];
  //     claimServiceDate = details["item"][0]["servicedDate"];
  //     claimAmount = details["item"][0]["unitPrice"]["value"];
  //     claimAdjudicatedAmount = details["item"][0]['net']["value"];
  //     claimOutOfPocket = claimAmount - claimAdjudicatedAmount;
  //   }

    //Uncomment till here and delete from here
    claimPriority = "Normal";
    doctorReference = "123#234";
    claimCoverageId = "claim_id_123";
    claimServiceDate = "21 Jan 2019";
    claimAmount = 130.0;
    claimAdjudicatedAmount = 123.0;
    claimOutOfPocket = claimAmount - claimAdjudicatedAmount;
  }
}

void setupClaims() {
  Claim claim = Claim();
  claim.getClaimsData();

  print("=====Inside Claims=====");
  print(claimAmount);
}
