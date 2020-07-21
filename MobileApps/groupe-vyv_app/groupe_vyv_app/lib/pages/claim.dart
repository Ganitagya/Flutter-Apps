class Claim {
  String claim_id;
  DateTime date;

  Claim({ String claim_id }){
    this.claim_id = claim_id;
    DateTime now = new DateTime.now();
    this.date = new DateTime(now.year, now.month, now.day, now.hour, now.minute, now.second, now.millisecond);
  }
}