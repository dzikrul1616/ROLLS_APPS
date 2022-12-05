import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/modules/home/views/home_view.dart';
import '../controllers/group_controller.dart';

// class GroupView extends StatefulWidget {
//   const GroupView({Key? key}) : super(key: key);

//   @override
//   State<GroupView> createState() => _GroupViewState();
// }

// class _GroupViewState extends State<GroupView> {
//   final user = FirebaseAuth.instance.currentUser!;

//   @override
//   Widget build(BuildContext context) {

//   }
// }

class GroupView extends GetView<GroupController> {
  final user = FirebaseAuth.instance.currentUser!;
  GroupView({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          user.email!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              color: Color.fromARGB(255, 55, 54, 54)),
                        ),
                        // const SizedBox(
                        //   width: 60.0,
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    child: Image.asset("assets/logo/Team.png"),
                    height: 40,
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(),
                  child: LayoutBuilder(builder: (context, constraints) {
                    List<Map> items = <Map>[
                      {
                        "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
                        "label": "ROLLS TEAMS",
                        "info": "Programmer"
                      },
                      {
                        "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
                        "label": "ROLL1",
                        "info": "Programmer"
                      },
                      {
                        "photo": "https://i.ibb.co/PGv8ZzG/me.jpg",
                        "label": "ROLL2",
                        "info": "Programmer"
                      },
                      {
                        "photo":
                            "https://i.ibb.co/5v5RLKr/photo-1528813860492-bb99459ec095-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                        "label": "Renata",
                        "info": "System Analyst"
                      },
                      {
                        "photo":
                            "https://i.ibb.co/mR8PJCz/photo-1576570734316-e9d0317d7384-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
                        "label": "Kayla",
                        "info": "Test Engineer"
                      }
                    ];

                    return Autocomplete<Map>(
                      fieldViewBuilder: (context, textEditingController,
                          focusNode, onFieldSubmitted) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onSubmitted: (text) => onFieldSubmitted(),
                          decoration: const InputDecoration(
                            filled: true,
                            hoverColor: Colors.transparent,
                            labelStyle: TextStyle(
                              color: Colors.blueGrey,
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        );
                      },
                      initialValue: TextEditingValue(
                        text: items.first["label"],
                      ),
                      onSelected: (Map value) {
                        //selected value
                      },
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        if (textEditingValue.text == '') {
                          return const Iterable<Map>.empty();
                        }
                        return items.where((Map option) {
                          return option["label"]
                              .toString()
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      displayStringForOption: (option) {
                        return option["label"];
                      },
                      optionsViewBuilder: (context, onSelected, options) =>
                          Align(
                        alignment: Alignment.topLeft,
                        child: Material(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(4.0),
                            ),
                          ),
                          child: Container(
                            width: constraints.biggest.width,
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Wrap(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(12.0),
                                    ),
                                    border: Border.all(
                                      width: 1.0,
                                      color: Colors.grey[300]!,
                                    ),
                                  ),
                                  child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    itemCount: options.length,
                                    shrinkWrap: true,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      bool selected =
                                          AutocompleteHighlightedOption.of(
                                                  context) ==
                                              index;
                                      Map option = options.elementAt(index);

                                      return InkWell(
                                        onTap: () => onSelected(option),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: selected
                                                ? Theme.of(context).focusColor
                                                : null,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                index == 0 ? 12 : 0,
                                              ),
                                              topRight: Radius.circular(
                                                index == 0 ? 12 : 0,
                                              ),
                                              bottomLeft: Radius.circular(
                                                index == options.length - 1
                                                    ? 12
                                                    : 0.0,
                                              ),
                                              bottomRight: Radius.circular(
                                                index == options.length - 1
                                                    ? 12
                                                    : 0.0,
                                              ),
                                            ),
                                          ),
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                option["photo"],
                                              ),
                                            ),
                                            title: Text("${option["label"]}"),
                                            subtitle: Text("${option["info"]}"),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Team",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return ForgotPasswordView();
                        // }));
                      },
                      child: Text(
                        "See All",
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
              ),
              const SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          "https://i.ibb.co/PGv8ZzG/me.jpg",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Container(
                              child: ClipOval(
                                  child: Container(
                            width: 42,
                            height: 42,
                            color: Colors.grey,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                color: appBackground,
                              ),
                            ),
                          ))),
                        ),
                        const SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          'Add Team',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    color: Colors.lightBlueAccent[100],
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Icon(
                            Icons.dehaze_outlined,
                            size: 15,
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Project Team',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    fontFamily: "Roboto",
                                  ),
                                ),
                                Icon(
                                  Icons.developer_board,
                                  color: Colors.lightBlueAccent[100],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: appBackground,
                                      height: 190,
                                      width: 160,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: appBackground,
                                      height: 190,
                                      width: 160,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: appBackground,
                                      height: 190,
                                      width: 160,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
