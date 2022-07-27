import 'package:flutter/material.dart';

class AddSupplierScreen extends StatefulWidget {
  AddSupplierScreen({Key? key}) : super(key: key);

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Add supplier"),
    ));
  }
}
