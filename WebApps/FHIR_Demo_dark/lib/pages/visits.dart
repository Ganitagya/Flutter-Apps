import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class VisitsPage extends StatefulWidget with NavigationStates {
  @override
  _VisitsPage createState() => _VisitsPage();
}

class _VisitsPage extends State<VisitsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.grey[850],
          centerTitle: true, // this is all you need
          title: Text(
            "Visits",
          ),
        ),
      ),
    );
  }
}
