import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/home/views/home_view.dart';
import 'package:rolls_apps/app/modules/profil/views/profil_view.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  // final user = FirebaseAuth.instance.currentUser!;
  EditProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 2.0,
        title: const Text("Edit Profil"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/logo/option.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1194&q=80",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 36.0,
                          backgroundImage: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25.0,
                  ),
                  TextFormField(
                    // controller: usernameController,
                    initialValue: 'user.email!',
                    maxLength: 20,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "What's your name?",
                    ),
                    onChanged: (value) {},
                  ),
                  TextFormField(
                    // controller: statusController,
                    initialValue:
                        "Designer UI/UX Mobile Apps dan Logo, Email : rolls111138@gmail.com",
                    maxLength: 200,
                    maxLines: 3,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      labelStyle: TextStyle(
                        color: Colors.blueGrey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueGrey,
                        ),
                      ),
                      helperText: "Set pesan status",
                    ),
                    onChanged: (value) {},
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  LayoutBuilder(builder: (context, constraint) {
                    List<String> itemStringList = ["ROLLS TEAM", "WHD TEAMS"];

                    return FormField(
                      initialValue: false,
                      enabled: true,
                      builder: (FormFieldState<bool> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Display Team",
                            errorText: field.errorText,
                            helperText: "Your Teams",
                          ),
                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: "ROLLS TEAM",
                                icon: Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Icon(
                                    Icons.arrow_drop_down_outlined,
                                    size: 24.0,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                                iconSize: 16,
                                elevation: 16,
                                style: TextStyle(
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .fontSize,
                                  fontFamily: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .fontFamily,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                ),
                                underline: Container(
                                  height: 0,
                                  color: Colors.grey[300],
                                ),
                                onChanged: (String? newValue) {},
                                items: itemStringList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        value,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  const SizedBox(
                    height: 35.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProfilView()));
                    },
                    child: Container(
                        width: 400,
                        height: 50,
                        child: Center(
                            child: Text(
                          "save",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ))),
                    style: ElevatedButton.styleFrom(primary: appBluesoft),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
