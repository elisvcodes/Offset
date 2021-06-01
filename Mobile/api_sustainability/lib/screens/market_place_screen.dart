import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';

class MarketPlaceScreen extends StatefulWidget {
  @override
  MarketPlaceScreenState createState() => new MarketPlaceScreenState();
}

class MarketPlaceScreenState extends State<MarketPlaceScreen>
    with SingleTickerProviderStateMixin {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
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
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Market Place'),
        bottom: TabBar(
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4,
          tabs: [
            Tab(text: "ITEMS", icon: Icon(Icons.crop_square)),
            Tab(text: "GREEN", icon: Icon(MdiIcons.flowerTulipOutline)),
            Tab(text: "REUSABLE", icon: Icon(Icons.repeat)),
            Tab(text: "ALL", icon: Icon(Icons.border_all)),
          ],
          controller: _tabController,
        ),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroller) {
          return <Widget>[];
        },
        body: TabBarView(
          children: [
            Align(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsGrid(ShowOptions.ShowGeneric),
            ),
            Align(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsGrid(ShowOptions.ShowGreen),
            ),
            Align(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsGrid(ShowOptions.ShowReusable),
            ),
            Align(
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ProductsGrid(ShowOptions.ShowAll),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
