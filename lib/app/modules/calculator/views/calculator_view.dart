import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolls_apps/app/widget/reusable_widget.dart';

import '../controllers/calculator_controller.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _Calculator {}

class _CalculatorState extends State<Calculator> {
  final userController = TextEditingController();
  State<Calculator> createState() => _CalculatorState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 50.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('SliverAppBar'),
              background: Image.network(
                "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1194&q=80",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 0,
              (BuildContext context, int index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(64.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Save"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
