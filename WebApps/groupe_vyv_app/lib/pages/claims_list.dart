import 'claim.dart';

List<Claim> claims_list = [];


insert_to_claims_list(Claim claim){
  claims_list.insert(0, claim);
  print(claims_list);
}