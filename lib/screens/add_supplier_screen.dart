import 'package:flutter/material.dart';
import 'package:inventory_app/widgets/bottom_sheet.dart';

class AddSupplierScreen extends StatefulWidget {
  const AddSupplierScreen({Key? key}) : super(key: key);

  @override
  State<AddSupplierScreen> createState() => _AddSupplierScreenState();
}

class _AddSupplierScreenState extends State<AddSupplierScreen> {
  String title = "";
  String description = "";
  Widget buildTitle() => TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Icon(
              Icons.abc,
            ),
          ),
          hintText: "Supplier title",
        ),
        onChanged: (value) => setState(() => title = value),
      );
  Widget buildDescription() => TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(Icons.description),
          hintText: "Supplier description",
        ),
        onChanged: (value) => setState(() => description = value),
      );
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        title: "Add supplier form",
        child: Column(
          children: [
            buildTitle(),
            const SizedBox(
              height: 16,
            ),
            buildDescription(),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
