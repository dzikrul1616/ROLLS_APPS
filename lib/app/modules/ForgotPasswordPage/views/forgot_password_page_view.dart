import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/home/views/home_view.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';
import 'package:rolls_apps/app/widget/reusable_widget.dart';

import '../controllers/forgot_password_page_controller.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Enter your Email and we will send your password reset link",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff2F2A85),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
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
                      TextField(
                        controller: _emailTextController,
                        cursorColor: appPrimary,
                        style: TextStyle(
                            color: appPrimary, fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                          // prefixIcon: Icon(icon, color: appPrimary),
                          labelText: "Email",
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff888888),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          fillColor: Color(0xffE8E8E8),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                  width: 0, style: BorderStyle.none)),
                        ),
                      ),
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
                      ElevatedButton(
                        onPressed: passwordReset,
                        child: Container(
                          width: 312,
                          height: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: appBackground,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: appBluesoft),
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
