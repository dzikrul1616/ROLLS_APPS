import 'dart:ffi';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/LoginView/views/login_view_view.dart';
import 'package:rolls_apps/app/modules/edit_profil/views/edit_profil_view.dart';
import 'package:rolls_apps/app/provider/google_sign_in.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);
  @override
  State<ProfilView> createState() => _ProfilView();
}

class _ProfilView extends State<ProfilView> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackground,
        title: Text(
          user.email!,
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Andrew Garfield"),
              accountEmail: Text(user.email!),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              otherAccountsPictures: const [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/women/74.jpg"),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(
                      "https://randomuser.me/api/portraits/men/47.jpg"),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Setting"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text("Saved"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.rule),
              title: const Text("Login Activity"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text("Privacy Policy"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text("Logout"),
              onTap: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                FirebaseAuth.instance.signOut().then((value) {
                  print("Signed Out");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                });
              },
            )
          ],
        ),
      ),
      body: Stack(
        children: [   
          Container(
            color: appBackground,
          ),
          SafeArea(
              child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Expanded(
                  child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 45.0,
                          backgroundImage: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rolls Team",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Designer UI/UX Mobile Apps dan Logo, Email : rolls111138@gmail.com",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 30,
                                    color: appBackground,
                                    child: ElevatedButton(
                                        onPressed: (() => Navigator.of(context)
                                            .pushReplacement(MaterialPageRoute(
                                                builder: (context) =>
                                                    EditProfilView()))),
                                        child: Text("Edit")),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 30,
                                    color: appBackground,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          final provider =
                                              Provider.of<GoogleSignInProvider>(
                                                  context,
                                                  listen: false);
                                          provider.logout();
                                          FirebaseAuth.instance
                                              .signOut()
                                              .then((value) {
                                            print("Signed Out");
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Login()));
                                          });
                                        },
                                        child: Text("LogOut")),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }
}
