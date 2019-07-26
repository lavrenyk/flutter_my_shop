import 'package:flutter/material.dart';

import '../models/product.dart';

class ProductDetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  product = ModalRoute.of(context).settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Center(child: Text('Product details!'),),
    );
  }
}
