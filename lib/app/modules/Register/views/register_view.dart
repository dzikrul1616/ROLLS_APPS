import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/LoginView/views/login_view_view.dart';
import 'package:rolls_apps/app/modules/home/views/home_view.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';
import 'package:rolls_apps/app/widget/reusable_widget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.0),
            child: Opacity(
              opacity: 0.6,
              child: ClipPath(
                clipper: ClippingClass(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 235,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo/building.png"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          Container(
            // width: 50,
            // height: 50,
            // color: appBackground,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //       image: AssetImage("assets/logo/LogoWarna.png"),
            //       fit: BoxFit.cover),
            // ),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 140,
                ),
                Container(
                  alignment: Alignment.center,
                  child: ClipOval(
                    child: Container(
                      width: 110,
                      height: 110,
                      color: appBackground,
                      child: Image.asset(
                        "assets/logo/rolls2.png",
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 40,
                // ),
                Container(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    "assets/logo/rolls3.png",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register first to Rolls",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff2F2A85),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Center(
                      child: Column(
                    children: [
                      reusableTextField(
                          "Username", false, _usernameTextController),
                      SizedBox(
                        height: 15,
                      ),
                      reusableTextField("Email", false, _emailTextController),
                      SizedBox(
                        height: 15,
                      ),
                      reusableTextField(
                          "Password", true, _passwordTextController),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Text("Anda menyetujui segala persayaratan yang ada"),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      signInSignUpButton(context, false, () {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _emailTextController.text,
                                password: _passwordTextController.text)
                            .then((value) {
                          print("Created New Account");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => convexbottombar()));
                        }).onError((error, stackTrace) {
                          print("Error ${error.toString()}");
                        });
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an Account? '),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Login();
                              }));
                            },
                            child: Text(
                              "Login Here",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appPrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          BackButton(
            color: Colors.white,
            onPressed: () => Get.offAllNamed(Routes.LOGIN_VIEW),
          )
        ]),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
