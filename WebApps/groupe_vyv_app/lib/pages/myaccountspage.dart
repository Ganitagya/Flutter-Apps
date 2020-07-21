import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'claim_card.dart';
import 'claims_list.dart';

class MyAccountsPage extends StatefulWidget with NavigationStates {
  @override
  _MyAccountsPage createState() => _MyAccountsPage();
}

class _MyAccountsPage extends State<MyAccountsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Claims',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children:
              claims_list.map((claim) => ClaimCard(claim: claim)).toList(),
        ),
      ),
    );
  }
}

