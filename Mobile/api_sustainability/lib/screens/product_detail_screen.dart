import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../providers/product.dart';
import '../providers/auth.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<Product>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10),
              Text(
                '${loadedProduct.title}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                child: Text('Add Product to Tracking'),
                onPressed: () {
                  loadedProduct.toggleFavoriteStatus(
                      authData.token, authData.userId);
                  final snackBar = SnackBar(
                    content: Text(
                      'Item is being Tracked!',
                    ),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        loadedProduct.toggleFavoriteStatus(
                            authData.token, authData.userId);
                      },
                    ),
                  );

                  _scaffoldKey.currentState.showSnackBar(snackBar);
                },
                textColor: Theme.of(context).primaryColor,
              ),
              Text("Carbon usage",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Text("Estimated lifespam of the product: 3 years",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              Text("Estimated purchase per year: 2 times",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 10),
              //   height: 1000,
              //   width: double.infinity,
              //   child: Text(
              //     loadedProduct.description,
              //     textAlign: TextAlign.center,
              //     softWrap: true,
              //   ),
              // )
            ]),
          ),
        ],
      ),
    );
  }
}
