import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/constant/color.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  NotificationView({Key? key}) : super(key: key);
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
                  'Notifikasi',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo/teams2.png",
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 2,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: const NetworkImage(
                                "https://i.ibb.co/QrTHd59/woman.jpg",
                              ),
                            ),
                            title: const Text("Group Chat Team Start"),
                            subtitle: const Text(
                                "Klik untuk masuk kedalam grup team chat"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/logo/Activity.png",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: const NetworkImage(
                                "https://i.ibb.co/QrTHd59/woman.jpg",
                              ),
                            ),
                            title: const Text("Jessica Jane"),
                            subtitle: const Text("Mulai Mengikuti Anda"),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
