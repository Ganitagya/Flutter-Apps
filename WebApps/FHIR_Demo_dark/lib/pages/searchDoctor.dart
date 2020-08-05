import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class searchDoctorPage extends StatefulWidget with NavigationStates {
  @override
  _searchDoctorPage createState() => _searchDoctorPage();
}

class _searchDoctorPage extends State<searchDoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.grey[850],

          title: Text(
            'Search Doctors',
            // style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          // backgroundColor: Colors.blue,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(5.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        // color: Color(getColorHexFromStr('#FEDF62')),
                        size: 30.0,
                      ),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                      hintText: 'search ...',
                      hintStyle: TextStyle(
                          color: Colors.grey[700], fontFamily: 'Quicksand')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
