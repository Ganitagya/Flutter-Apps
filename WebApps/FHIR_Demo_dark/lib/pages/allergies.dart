import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class AllergiesPage extends StatefulWidget with NavigationStates {
  @override
  _AllergiesPage createState() => _AllergiesPage();
}

class _AllergiesPage extends State<AllergiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        centerTitle: true, // this is all you need
        title: Text(
          "ALLERGIES",
        ),
      ),
    );
  }
}