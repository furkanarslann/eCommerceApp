import 'package:flutter/material.dart';

import 'package:http_demo/models/product.dart';
import 'package:http_demo/widgets/product_list_row_widget.dart';

class ProductListWidget extends StatefulWidget {
  List<Product> products = [];
  ProductListWidget(this.products) {}

  @override
  State<StatefulWidget> createState() {
    return ProductListWidgetState();
  }
}

class ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildProductList(
        context); // ekranın boyutlarına erişmesi icin context
  }

// widget. yaparak bu classın extend ettigi üst classtaki(widgettaki) elemanlara erisebiliyorsun.
  Widget buildProductList(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10),
      SizedBox(
        height: 500,
        child: GridView.count(
          crossAxisCount: 2,
          children: List<Widget>.generate(widget.products.length, (index) {
            return ProductListRowWidget(widget.products[index]);
          }),
        ),
      ),
    ]);
  }
}


