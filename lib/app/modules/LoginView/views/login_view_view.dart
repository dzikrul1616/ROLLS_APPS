import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/ForgotPasswordPage/views/forgot_password_page_view.dart';
import 'package:rolls_apps/app/modules/home/views/home_view.dart';
import 'package:rolls_apps/app/provider/google_sign_in.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';
import 'package:rolls_apps/app/widget/reusable_widget.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:rolls_apps/lib/app/modules/controllers/add_controller.dart';

import '../controllers/login_view_controller.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class LoginGoState extends StatefulWidget {
  const LoginGoState({Key? key}) : super(key: key);
  @override
  _loginGoState createState() => _loginGoState();
}

class _loginGoState extends State<LoginGoState> {
  Future<FirebaseApp> _initilizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initilizeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Login();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<Login> {
  GoogleSignInAccount? _currentUser;
  // bool _isloading = false;
  Future<void> _handleSignIn(context) async {
    final googleSignIn = GoogleSignIn();
    final googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await FirebaseAuth.instance.signInWithCredential(
              GoogleAuthProvider.credential(
                  idToken: googleAuth.idToken,
                  accessToken: googleAuth.accessToken));
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => convexbottombar(),
            ),
          );
        } on FirebaseAuthException catch (error) {
        } catch (error) {
        } finally {}
      }
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        _currentUser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }

    return user;
  }

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
        body: _currentUser == null
            ? SafeArea(
                child: Stack(
                  children: [
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
                          "Welcome to Rolls !",
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
                        Center(
                          child: Form(
                              child: Column(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Column(
                                  children: [
                                    reusableTextField(
                                        "Email", false, usernameController),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    reusableTextField(
                                        "Password", true, passwordController),
                                    // SizedBox(
                                    //   height: 15,
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () =>
                                    Get.offAllNamed(Routes.REGISTER),
                                child: Container(
                                  width: 110,
                                  alignment: Alignment.center,
                                  height: Get.width * 0.15,
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: appBluesoft),
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  User? user = await loginUsingEmailPassword(
                                      email: usernameController.text,
                                      password: passwordController.text,
                                      context: context);
                                  print(user);
                                  if (user != null) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                convexbottombar()));
                                  }
                                },
                                child: Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  height: Get.width * 0.15,
                                  child: Icon(
                                    Icons.chevron_right_sharp,
                                    size: 30,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: appPrimary),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ForgotPasswordView();
                            }));
                          },
                          child: Text(
                            "Forgot Pasword?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: appPrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: ElevatedButton(
                            onPressed: () => _handleSignIn(context),
                            // final provider = Provider.of<GoogleSignInProvider>(context,
                            //     listen: false);
                            // provider.googleLogin();
                            // User? user = await provider.googleLogin();
                            // print(user);
                            // if (user != null) {
                            //   Navigator.of(context).pushReplacement(MaterialPageRoute(
                            //       builder: (context) => convexbottombar()));
                            // }
                            // },
                            child: Container(
                              width: 312,
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/logo/Group 2.png",
                                    height: 160,
                                    width: 160,
                                  ),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: appBackground),
                          ),
                        ),
                        // Center(
                        //     child: Text(
                        //   "Rolls Company",
                        //   style:
                        //       TextStyle(color: appBluesoft, fontWeight: FontWeight.w400),
                        // )),
                      ],
                    )),
                    //
                  ],
                ),
              )
            : Container(
                child: ListTile(
                  leading: GoogleUserCircleAvatar(identity: _currentUser!),
                  title: Text(_currentUser!.displayName ?? ''),
                  subtitle: Text(_currentUser!.email),
                ),
              ));
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
