import 'package:flutter/material.dart';
import 'package:inventory_app/screens/add_category_screen.dart';
import 'package:inventory_app/screens/add_product_screen.dart';
import 'package:inventory_app/screens/add_supplier_screen.dart';
import 'package:inventory_app/widgets/bottom_sheet.dart';
import 'package:inventory_app/widgets/list_builder.dart';
import '../apis/get_category.dart';
import '../apis/get_product.dart';
import '../apis/get_supplier.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> myBodyWidget = <Widget>[];
  late Future<List> future;

  static const List<Widget> myBottomSheet = <Widget>[
    AddProductScreen(),
    AddCategoryScreen(),
    AddSupplierScreen(),
    // const CustomBottomSheet(),
  ];

  var appBarTitle = "";
  void onAddButtonTapped;

  @override
  void initState() {
    super.initState();
    future = fetchProduct();
    myBodyWidget = <Widget>[ListBuilder(datalist: future)];
    appBarTitle = "Product";
  }

  void _onItemTapped(int index) {
    var data;

    if (index == 0) {
      setState(() {
        appBarTitle = "Product";
      });
      data = fetchProduct();
    } else if (index == 1) {
      setState(() {
        appBarTitle = "Category";
      });
      data = fetchCategory();
    } else {
      setState(() {
        appBarTitle = "Supplier";
      });
      data = fetchSupplier();
    }
    setState(() {
      _selectedIndex = index;
      myBodyWidget = <Widget>[ListBuilder(datalist: data)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(appBarTitle),
        ),
      ),
      body: myBodyWidget.elementAt(0),
      floatingActionButton: InkWell(
        child: FloatingActionButton(
          onPressed: () {
            if (_selectedIndex == 0) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return myBottomSheet.elementAt(_selectedIndex);
                  });
            } else if (_selectedIndex == 1) {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return myBottomSheet.elementAt(_selectedIndex);
                  });
            } else {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return myBottomSheet.elementAt(_selectedIndex);
                  });
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Supplier',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
