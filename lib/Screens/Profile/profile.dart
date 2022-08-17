// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practise/Screens/Login/login.dart';
import 'package:practise/Utils/Constraints.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    key,
  }) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<ProfileScreen> {
  var currentIndex = 3;

//bottombar icons
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.search_sharp,
    Icons.local_library_outlined,
    Icons.settings_rounded,
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    final _auth = FirebaseAuth.instance;

    return Scaffold(
      backgroundColor: kPrimaryWhiteColor,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     "Profile",
      //     style: TextStyle(
      //       color: kPrimaryYellow,
      //       fontSize: 18,
      //     ),
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 8.0),
      //       child: IconButton(
      //         icon: Icon(Icons.close, color: kPrimaryWhiteColor),
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => HomeScreen()),
      //           // );
      //         },
      //       ),
      //     ),
      //   ],
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowGlow();
          return false;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              left: 20,
            ),
            child: Column(
              children: <Widget>[
                // SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              );
                            },
                            child: Image.asset(
                              "assets/png/aaru.png",
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Aaruran L',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Show Profile',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Show Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 0,
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Text(
                                "Personal Information",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Change Password",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Social Connect",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Switch to local guide",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Terms of Services",
                                style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0,
                            color: kPrimaryGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                InkWell(
                  highlightColor: kPrimaryBlueColor,
                  onTap: () {
                    _auth.signOut().whenComplete(() {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn_body(),
                        ),
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      bottom: 10,
                      top: 10,
                    ),
                    child: Container(
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.people,
            ),
          ),
        ],
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.home_rounded,
  Icons.search_sharp,
  Icons.local_library_outlined,
  Icons.settings_rounded,
];

//LOGOUT
void _handleLogout(BuildContext context) async {
  try {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    localStorage.remove('userId');

    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => Signup()));
  } catch (e) {
    print(e);
  }
}
