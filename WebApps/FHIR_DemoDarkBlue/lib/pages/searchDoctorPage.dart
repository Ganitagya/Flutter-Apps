import 'package:flutter/material.dart';
import '../bloc/navigation_bloc/navigation_bloc.dart';
import 'package:FHIR_Demo/services/searchService.dart';
import 'package:FHIR_Demo/services/listOfAllDoctors.dart';

class searchDoctorPage extends StatefulWidget with NavigationStates {
  @override
  _searchDoctorPage createState() => _searchDoctorPage();
}

class _searchDoctorPage extends State<searchDoctorPage> {
  final formKey = GlobalKey<FormState>();

  String locationOfDoctor;

  @override
  Widget build(BuildContext context) {
    print(
        "===================================MediaQuery.of(context).size.width=======");
    print(MediaQuery.of(context).size.width);
    print(
        "===================================MediaQuery.of(context).size.width=======");

    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // here the desired height

        child: AppBar(
          backgroundColor: Colors.blue[900],

          title: Text(
            'Search Doctors',
            // style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          // backgroundColor: Colors.blue,
        ),
      ),
      body: Container(
        color: Colors.blue[100],
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 270.0,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      border: Border.all(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        // height: 160.0,
                        decoration: BoxDecoration(
                          color: Colors.indigo[900],
                          border: Border.all(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Filter Your Search",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Gender: ",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                              value: checkMale,
                              onChanged: (bool value) {
                                setState(
                                  () {
                                    print(value);
                                    checkMale = value;
                                  },
                                );
                              }),
                        ),
                        Text(
                          "Female",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                        ),
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                              value: checkFemale,
                              onChanged: (bool value) {
                                setState(
                                  () {
                                    print(value);
                                    checkFemale = value;
                                  },
                                );
                              }),
                        ),
                        Text(
                          "Male",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 4.65,
                          right: MediaQuery.of(context).size.width / 4.65),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Looking for a specific location?",
                                style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    color: Colors.white,
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(5.0),
                            child: Form(
                              key: formKey,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.location_searching,
                                    // color: Color(getColorHexFromStr('#FEDF62')),
                                    size: 30.0,
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 15.0),
                                  hintText: 'Enter Location',
                                  hintStyle: TextStyle(
                                      color: Colors.blue[700],
                                      fontFamily: 'Quicksand'),
                                ),
                                validator: (input) => input == '' ? null : null,
                                onSaved: (String value) {
                                  locationOfDoctor = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      child: Text("Search"),
                      onPressed: () async {
                        if (!formKey.currentState.validate()) {
                          formKey.currentState.save();
                          print("with validation");
                          searchDoctors(locationOfDoctor);
                        } else {
                          formKey.currentState.save();
                          print("without validation");
                          await searchDoctors(locationOfDoctor);
                          print("returned with searched doctors");
                          showSearch(
                              context: context, delegate: doctorSearch());
                        }
                      },
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class doctorSearch extends SearchDelegate<String> {
  String familyName;
  String givenName;
  String suffix;
  String phone;
  String addFirstLine;
  String city;
  String state;
  String postalCode;
  String gender;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.blue[900],
    );
  }

  @override
  String get searchFieldLabel => 'Search Doctor';

  List<Widget> buildActions(BuildContext context) {
    // actions for app bar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results based on the selection
    return Container(
        color: Colors.blue[100],
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      height: 450.0,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        border: Border.all(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          // height: 160.0,
                          decoration: BoxDecoration(
                            color: Colors.indigo[900],
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Center(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 35,
                                      ),
                                      this.gender == "male"
                                          ? CircleAvatar(
                                              backgroundImage:
                                                  AssetImage('maledoctor.jpeg'),
                                              radius: 60.0,
                                            )
                                          : CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'femaledoctor.png'),
                                              radius: 60.0,
                                            ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Name : ",
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            this.suffix,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            this.givenName,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            this.familyName,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Gender :",
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            this.gender,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Contact :",
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            this.phone,
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Work Address :",
                                            style: TextStyle(
                                                fontFamily: 'Quicksand',
                                                color: Colors.white,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Text("\t \t"),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                this.addFirstLine,
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                this.city,
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                this.postalCode,
                                                style: TextStyle(
                                                    fontFamily: 'Quicksand',
                                                    color: Colors.white,
                                                    fontSize: 16.0,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for names of doctors
    final suggestionsList = query.isEmpty
        ? searchedDoctorsList
            .where((element) => element["familyName"].startsWith(query))
            .toList()
        : searchedDoctorsList
            .where((element) => element["familyName"].startsWith(query))
            .toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          this.suffix = suggestionsList[index]["suffix"];
          this.givenName = suggestionsList[index]["givenName"];
          this.familyName = suggestionsList[index]["familyName"];
          this.gender = suggestionsList[index]["gender"];
          this.addFirstLine = suggestionsList[index]["addFirstLine"];
          this.city = suggestionsList[index]["city"];
          this.phone = suggestionsList[index]["phone"];
          this.postalCode = suggestionsList[index]["postalCode"];

          showResults(context);
        },
        leading: Icon(Icons.person),
        title: Text(suggestionsList[index]["suffix"] +
            " " +
            suggestionsList[index]["familyName"]),
      ),
      itemCount: suggestionsList.length,
    );
  }

  // Reference : https://www.youtube.com/watch?v=FPcl1tu0gDs
}
