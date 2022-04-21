import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/data/api/category_api.dart';
import 'package:http_demo/data/api/product_api.dart';
import 'package:http_demo/models/category.dart';
import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Category> categories = <Category>[]; // apidan gelcek kategoriler
  List<Widget> categoryWidgets =<Widget>[]; // widget haline gelmiş kategoriler.
  List<Product> products = [];
  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text('Hepsiburada', style: TextStyle(color: Colors.amber[900],)),
        backgroundColor: Colors.blueGrey[100],
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categoryWidgets,
              ),
            ),
            ProductListWidget(products),
          ],
        ),
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categories = list.map((element) => Category.fromJson(element)).toList();
        getCategoryWidgets();
      });
    });
  }

  List<Widget> getCategoryWidgets() {
    for (int i = 0; i < categories.length; i++) {
      categoryWidgets.add(getCategoryWidget(categories[i]));
    }
    return categoryWidgets;
  }

  Widget getCategoryWidget(Category category) {
    return ElevatedButton(
      onPressed:() => getProductsByCategoryId(category),
      child: Text(
        category.categoryName.toString(),
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(Colors.amber[900]) ,
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.orange.shade900),
      ))),
    );
  }

  void getProductsByCategoryId(Category category) {
      ProductApi.getProductsByCategoryId(category.id ?? 0).then((response){
        setState(() {
          Iterable list = json.decode(response.body);
          products = list.map((e) => Product.fromJson(e)).toList();
        });
        
      });
  }
  
}
