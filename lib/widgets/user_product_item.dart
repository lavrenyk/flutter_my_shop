import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  UserProductItem({
    this.id,
    this.title,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed('/edit-product', arguments: id);
              },
            ),
            IconButton(
              icon: Icon(Icons.delete_forever),
              color: Theme.of(context).errorColor,
              onPressed: () {
                Provider.of<Products>(context).deleteProducts(id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
