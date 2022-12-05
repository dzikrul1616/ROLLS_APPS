import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditdataController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController priceC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void editProduct(String name, String price, String docID) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      await docData.update({
        "nama": name,
        "price": price,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data produk",
        onConfirm: () {
          nameC.clear();
          priceC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil mengubah produk",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    priceC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    priceC.dispose();
    super.onClose();
  }
}
