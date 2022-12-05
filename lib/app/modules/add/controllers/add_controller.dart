import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.snapshots();
  }

  void deleteProduct(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    try {
      await docRef.delete();
      Get.defaultDialog(
          title: "Delete Data",
          middleText: "Apakah kamu yakin ingin menghapus data ini?",
          onConfirm: () async {
            await docRef.delete();
            Get.back();
          },
          textConfirm: "YES",
          textCancel: "No");
    } catch (e) {
      print(e);
      Get.defaultDialog(
          title: "Terjadi Kesalahan",
          middleText: "Tidak Berhasil Menghapus Data");
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
