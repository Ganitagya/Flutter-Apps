import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../bloc/navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';
import 'package:FHIR_Demo/services/memberService.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      // initialData: true,
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 40,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  // color: Colors.lightBlueAccent,
                  color: Colors.indigo[500],
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 115.0,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 20.0,
                                ),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/profile_pic.png'),
                                  radius: 45,
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Profile Name : $firstName",
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Email : $email",
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Birth Date : $dateOfBirth",
                                      style: TextStyle(
                                          fontFamily: 'Quicksand',
                                          color: Colors.white,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 54,
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 32,
                        endIndent: 32,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        width: 9 * MediaQuery.of(context).size.height / 10,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: MenuItem(
                                icon: Icons.home,
                                title: "Home",
                                onTap: () {
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(
                                      NavigationEvents.HomePageClickedEvent);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: MenuItem(
                                icon: Icons.search,
                                title: "Search Doctors",
                                onTap: () {
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(
                                      NavigationEvents.MyAccountClickedEvent);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: MenuItem(
                                icon: Icons.add_circle,
                                title: "Medications",
                                onTap: () {
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(
                                      NavigationEvents
                                          .MyMedicationsClickedEvent);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: MenuItem(
                                icon: Icons.content_paste,
                                title: "Claims",
                                onTap: () {
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(
                                      NavigationEvents.MyClaimsClickedEvent);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 13,
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(
                              color: Colors.blueAccent,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              fit: BoxFit.fitHeight,
                              child: MenuItem(
                                icon: Icons.visibility,
                                title: "Encounters",
                                onTap: () {
                                  onIconPressed();
                                  BlocProvider.of<NavigationBloc>(context).add(
                                      NavigationEvents
                                          .MyEncountersClickedEvent);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 50,
                        thickness: 0.5,
                        color: Colors.black,
                        indent: 32,
                        endIndent: 32,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 5.15,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: MenuItem(
                                    icon: Icons.settings,
                                    title: "Settings",
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.fitHeight,
                                  child: MenuItem(
                                    icon: Icons.exit_to_app,
                                    title: "Logout",
                                    onTap: () {
                                      BlocProvider.of<NavigationBloc>(context)
                                          .add(NavigationEvents
                                              .HomePageClickedEvent);
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 100,
                                  height: 65.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    image: DecorationImage(
                                        image:
                                            AssetImage('tibco-logo-menu1.png'),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Text("Powered By TIBCO")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.85),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 30,
                      height: 100,
                      // color: Colors.lightBlueAccent,
                      color: Colors.indigo[500],
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        // color: Colors.black87,
                        // color: Color(0xFF1BB5FD),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

// reference : https://www.youtube.com/watch?v=oExw0U4U_UI&t=490s
