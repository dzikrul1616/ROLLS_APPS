import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/LoginView/views/login_view_view.dart';
import 'package:rolls_apps/app/modules/Register/views/register_view.dart';
import 'package:rolls_apps/app/modules/add/controllers/add_controller.dart';
import 'package:rolls_apps/app/modules/add/views/add_view.dart';
import 'package:rolls_apps/app/modules/group/bindings/group_binding.dart';
import 'package:rolls_apps/app/modules/group/views/group_view.dart';
import 'package:rolls_apps/app/modules/notification/views/notification_view.dart';
import 'package:rolls_apps/app/modules/profil/views/profil_view.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';
import 'package:rolls_apps/app/widgets/splash.dart';
import 'package:rolls_apps/main.dart';
import '../controllers/home_controller.dart';

// class Person implements Comparable<Person> {
//   final String name, surname;
//   final num age;

//   const Person(this.name, this.surname, this.age);

//   @override
//   int compareTo(Person other) => name.compareTo(other.name);
// }

class convexbottombar extends StatefulWidget {
  convexbottombar({Key? key}) : super(key: key);

  @override
  State<convexbottombar> createState() => _convexbottombarState();
}

class _convexbottombarState extends State<convexbottombar> {
  final _pgno = [
    HomeView(),
    GroupView(),
    AddView(),
    NotificationView(),
    ProfilView()
  ];

  int _pilihtabbar = 0;

  void _changetabbar(int index) {
    setState(() {
      _pilihtabbar = index;
    });
  }

  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pgno[_pilihtabbar],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: appPrimary,
          animationDuration: Duration(milliseconds: 300),
          // gradient: gradientPandB,
          height: 60,
          // top: -15,
          // curveSize: 60,
          color: appPrimary,
          // activeColor: appBackground,
          items: <Widget>[
            Icon(
              Icons.home,
              color: appBackground,
              size: 30,
            ),
            Icon(
              Icons.group,
              color: appBackground,
              size: 30,
            ),
            Icon(
              Icons.add,
              color: appBackground,
              size: 30,
            ),
            Icon(
              Icons.notifications,
              color: appBackground,
              size: 30,
            ),
            Icon(
              Icons.person,
              color: appBackground,
              size: 30,
            )
          ],
          onTap: (int i) {
            setState(() {
              _pilihtabbar = i;
            });
          },
        ));
  }
}

@override
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: appBackground,
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo/Eksplore.png",
                    ),
                    SizedBox(
                      width: 89,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.filter_alt),
                      color: appYoungBlue,
                    ),
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView(children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child:
                                  Image.asset("assets/logo/Recomendation.png"),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              color: Color(0xFFC4C4C4),
                              iconSize: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Fahrenhanaffi_",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   "from Rolls Team",
                                                      //   style: TextStyle(
                                                      //       fontWeight: FontWeight.w200,
                                                      //       color: Color.fromARGB(
                                                      //           255, 146, 119, 119),
                                                      //       fontSize: 12),
                                                      // ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                          "assets/logo/option.png"),
                                                      color: appYoungBlue
                                                      // iconSize: 20,
                                                      ),
                                                ]),
                                            Image.asset(
                                              "assets/logo/image phone.png",
                                              fit: BoxFit.scaleDown,
                                            ),
                                            Container(
                                              // alignment: Alignment.bottomLeft,
                                              width: 75,
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Follow",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: appBackground),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: appBackground,
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Fahrenhanaffi_",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   "from Rolls Team",
                                                      //   style: TextStyle(
                                                      //       fontWeight: FontWeight.w200,
                                                      //       color: Color.fromARGB(
                                                      //           255, 146, 119, 119),
                                                      //       fontSize: 12),
                                                      // ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                          "assets/logo/option.png"),
                                                      color: appYoungBlue
                                                      // iconSize: 20,
                                                      ),
                                                ]),
                                            Image.asset(
                                              "assets/logo/image phone.png",
                                              fit: BoxFit.scaleDown,
                                            ),
                                            Container(
                                              // alignment: Alignment.bottomLeft,
                                              width: 75,
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Follow",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: appBackground),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: appBackground,
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              children: [
                                ElevatedButton(
                                    onPressed: () {},
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  SizedBox(
                                                    height: 30,
                                                  ),
                                                  CircleAvatar(
                                                    radius: 20.0,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        "Fahrenhanaffi_",
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      // Text(
                                                      //   "from Rolls Team",
                                                      //   style: TextStyle(
                                                      //       fontWeight: FontWeight.w200,
                                                      //       color: Color.fromARGB(
                                                      //           255, 146, 119, 119),
                                                      //       fontSize: 12),
                                                      // ),
                                                    ],
                                                  ),
                                                  IconButton(
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                          "assets/logo/option.png"),
                                                      color: appYoungBlue
                                                      // iconSize: 20,
                                                      ),
                                                ]),
                                            Image.asset(
                                              "assets/logo/image phone.png",
                                              fit: BoxFit.scaleDown,
                                            ),
                                            Container(
                                              // alignment: Alignment.bottomLeft,
                                              width: 75,
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: () {},
                                                  child: Text(
                                                    "Follow",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: appBackground),
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      primary: appBackground,
                                    )),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            SizedBox(width: 10),

                            // Container(
                            //   width: 200,
                            //   height: 60,
                            //   color: appYoungBlue,
                            // )
                          ],
                        ),
                      ),
                    ),

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image.asset("assets/logo/Teams.png"),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.close),
                              color: Color(0xFFC4C4C4),
                              iconSize: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 200,
                              height: 65,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: appYoungBlue,
                                      width: 3,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10),
                                  color: appBackground),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CircleAvatar(),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Rolls Team",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "18 Member",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Color.fromARGB(
                                                  255, 146, 119, 119),
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_box_rounded),
                                        color: appYoungBlue
                                        // iconSize: 20,
                                        ),
                                  ]),
                            ),
                            SizedBox(width: 5),
                            Container(
                              width: 200,
                              height: 65,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: appYoungBlue,
                                      width: 3,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(10),
                                  color: appBackground),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    CircleAvatar(),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "Rolls Team",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          "18 Member",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Color.fromARGB(
                                                  255, 146, 119, 119),
                                              fontSize: 12),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.add_box_rounded),
                                        color: appYoungBlue
                                        // iconSize: 20,
                                        ),
                                  ]),
                            ),
                            // Container(
                            //   width: 200,
                            //   height: 60,
                            //   color: appYoungBlue,
                            // )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [Text("FahrenHanafiii")],
                                ),
                              ],
                            ),
                          ),
                          Image.asset("assets/logo/option.png")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 200,
                        height: 300,
                        child: Image.asset('assets/logo/grup15.png'),
                        color: appYoungBlue),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appPrimary,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10),
                                color: appPrimary),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.thumb_up_alt_sharp),
                                  color: appBackground,
                                  iconSize: 15,
                                ),
                                Text(
                                  "12,5k",
                                  style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appPrimary,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10),
                                color: appPrimary),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_red_eye),
                                  color: appBackground,
                                  iconSize: 20,
                                ),
                                Text(
                                  "196k",
                                  style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    //profil 2
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [Text("Dzikrullhakim02_")],
                                ),
                              ],
                            ),
                          ),
                          Image.asset("assets/logo/option.png")
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 200,
                        height: 300,
                        child: Image.asset('assets/logo/grup15.png'),
                        color: appYoungBlue),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appPrimary,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10),
                                color: appPrimary),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.thumb_up_alt_sharp),
                                  color: appBackground,
                                  iconSize: 15,
                                ),
                                Text(
                                  "28,5k",
                                  style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: appPrimary,
                                    width: 2,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10),
                                color: appPrimary),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove_red_eye),
                                  color: appBackground,
                                  iconSize: 20,
                                ),
                                Text(
                                  "576k",
                                  style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
