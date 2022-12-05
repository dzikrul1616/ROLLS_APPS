import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:get/get.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';

import '../controllers/add_controller.dart';

// class AddView extends StatefulWidget {
//   const AddView({Key? key}) : super(key: key);

//   @override
//   State<AddView> createState() => _AddViewState();
// }

// class _AddViewState<T> extends State<AddView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('AddView'),
//         centerTitle: true,
//       ),
//     );
//   }
// }

// @override
class AddView extends GetView<AddController> {
  const AddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: appBackground,
          ),
          SafeArea(
              child: ListView(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'New Post',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'roboto',
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Image.asset(
                "assets/logo/add.png",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/logo/user.png'),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Tag someone',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    child: Image.asset('assets/logo/share.png'),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    child: Image.asset('assets/logo/dteam.png'),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Display team',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(),
                child: TextFormField(
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w100,
                    // color: Color.fromARGB(0, 139, 139, 139)
                  ),
                  maxLength: 200,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.blueGrey,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    helperText: "Write your description",
                  ),
                  onChanged: (value) {},
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: appPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // <-- Radius
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "POST",
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
