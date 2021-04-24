import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/app_drawer.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import './cart_screen.dart';
import '../providers/products.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts(); // WON'T WORK!
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          print("Loading is false");
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Place'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                switch (FilterOptions) {
                }
                // if (selectedValue == FilterOptions.Favorites) {
                //   _showOnlyFavorites = true;
                // } else {
                //   _showOnlyFavorites = false;
                // }
              });
            },
            icon: Icon(
              Icons.filter_alt_sharp,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('CUP'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('BOTTLE'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('BAG'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('CUTLERY'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('STRAW'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('CONTAINER'),
                value: FilterOptions.All,
              ),
              PopupMenuItem(
                child: Text('TOWEL'),
                value: FilterOptions.All,
              ),
            ],
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
