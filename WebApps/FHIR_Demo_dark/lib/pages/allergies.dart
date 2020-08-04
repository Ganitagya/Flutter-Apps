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
      appBar: AppBar(
        centerTitle: true, // this is all you need
        title: Text(
          "ALLERGIES",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.hourglass_full), title: Text('Allergies'))
        ],
      ),
    );
  }
}
