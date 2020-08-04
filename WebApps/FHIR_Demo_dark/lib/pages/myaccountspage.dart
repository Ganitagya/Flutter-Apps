import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';

class MyAccountsPage extends StatefulWidget with NavigationStates {
  @override
  _MyAccountsPage createState() => _MyAccountsPage();
}

class _MyAccountsPage extends State<MyAccountsPage> {
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");

    int val = 0;
    int len = colorStr.length;

    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        //A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        //A..F
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred while converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(getColorHexFromStr('#008D7B')),
      appBar: AppBar(
        title: Text(
          'Search Doctors',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Color(getColorHexFromStr('#A3C373')),
        // backgroundColor: Colors.blue,
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
                        color: Color(getColorHexFromStr('#FEDF62')),
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
