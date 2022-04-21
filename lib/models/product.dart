import 'package:flutter/cupertino.dart';

class Product {
  int? id;
  int? categoryId;
  String? productName;
  String? quantityPerUnit;
  double? unitPrice;
  int? unitsInStock;

  Product({
    required this.id,
    required this.categoryId,
    required this.productName,
    required this.quantityPerUnit,
    required this.unitPrice,
    required this.unitsInStock,
  });

  Product.fromJson(Map json) {
    id = json['id'];
    categoryId = json['categoryId'];
    productName = json['productName'];
    quantityPerUnit = json['quantityPerUnit'];
    unitPrice = double.tryParse(json['unitPrice'].toString());
    unitsInStock = int.tryParse(json['unitsInStock'].toString());
  }

  Map toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'productName': productName,
      'quantityPerUnit': quantityPerUnit,
      'unitsInStock': unitsInStock,
      'unitPrice': unitPrice,
    };
  }
}
