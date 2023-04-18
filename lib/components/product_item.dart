import 'package:flutter/material.dart';
import '../providers/product.dart';
import '../screens/home.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {

  //
  // final String id;
  // final String title;
  // final String imageurl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon( product.isFavorite ? Icons.favorite : Icons.favorite_border,),
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          // trailing: IconButton(
          //   icon: const Icon(Icons.shopping_cart),
          //   onPressed: () {},
          // ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Image.network(
            product.imageurl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
