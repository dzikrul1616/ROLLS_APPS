import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rolls_apps/app/constant/color.dart';
import 'package:rolls_apps/app/routes/app_pages.dart';
import 'package:rolls_apps/app/widget/reusable_widget.dart';

import '../controllers/konten_controller.dart';

class KontenView extends GetView<KontenController> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  KontenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Home",
              ),
              Tab(
                text: "Sales",
              ),
              Tab(
                text: "Profil",
              ),
            ],
          ),
          title: Center(child: const Text('Yasmin store')),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Top Sales",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Builder(
                      builder: (context) {
                        List items = [
                          {
                            "id": 1,
                            "photo":
                                "https://i.ibb.co/6NZ8dGk/Holiday-Travel-Agent-Promotion-Banner-Landscape.png",
                            "onTap": (item) {},
                          },
                          {
                            "id": 2,
                            "photo":
                                "https://i.ibb.co/5xfjdy9/Blue-Modern-Discount-Banner.png",
                            "onTap": (item) => Get.offAllNamed(Routes.ADD),
                          },
                          {
                            "id": 3,
                            "photo":
                                "https://i.ibb.co/6Rvjyy1/Brown-Yellow-Free-Furniture-Promotion-Banner.png",
                            "onTap": (item) {},
                          }
                        ];

                        return SizedBox(
                          height: 120.0,
                          child: ListView.builder(
                            itemCount: items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              var item = items[index];
                              return Container(
                                height: 100.0,
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: const EdgeInsets.only(right: 16.0),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      item["photo"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(
                                      16.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Recomendation',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Column(
                        children: [
                          reusableTextField('Email', false, usernameController),
                          const SizedBox(
                            height: 10.0,
                          ),
                          reusableTextField(
                              'Pasword', true, passwordController),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  child: Container(
                                    width: 135,
                                    height: Get.width * 0.14,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: appBackground,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Container(
                                  width: 135,
                                  height: Get.width * 0.14,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: appBackground,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: appPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            child: Text("Lupa kata sandi",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appPrimary,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                )),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Container(
                              width: 312,
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/logo/group2.png",
                                    height: 160,
                                    width: 160,
                                  ),
                                ],
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: appBackground),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.green[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
