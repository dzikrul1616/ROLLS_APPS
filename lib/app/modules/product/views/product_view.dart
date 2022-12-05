import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  const ProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductView'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller.priceC,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Price"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () => controller.addProduct(
                    controller.nameC.text, controller.priceC.text),
                child: Text("Add Product"))
          ],
        ),
      )),
    );
  }
}
