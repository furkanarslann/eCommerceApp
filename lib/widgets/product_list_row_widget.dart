import 'package:flutter/material.dart';
import 'package:http_demo/models/product.dart';

class ProductListRowWidget extends StatelessWidget {
  Product product;
  ProductListRowWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return buildProductItemCard(context);
  }

  Widget buildProductItemCard(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.blueGrey[50],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              child: Image.network(
                  'https://i.picsum.photos/id/1/200/200.jpg?hmac=jZB9EZ0Vtzq-BZSmo7JKBBKJLW46nntxq79VMkCiBG8'),
              height: 110,
              width: MediaQuery.of(context).size.width / 2,
            ),
            
            Text(product.productName.toString(), textAlign: TextAlign.center, ),
            Text('${product.unitPrice.toString()} \$', style: TextStyle(color: Colors.green),),
            Text('${product.unitsInStock.toString()} left', style: TextStyle(color: Colors.red),)
          ],
        ),
      ),
    );
  }
}
