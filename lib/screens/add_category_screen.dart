import 'package:flutter/material.dart';
import 'package:inventory_app/widgets/bottom_sheet.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({Key? key}) : super(key: key);

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
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
          hintText: "Category title",
        ),
        onChanged: (value) => setState(() => title = value),
      );
  Widget buildDescription() => TextFormField(
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          prefixIcon: Icon(Icons.description),
          hintText: "Category description",
        ),
        onChanged: (value) => setState(() => description = value),
      );
  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
        title: "Add category form",
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
