import 'package:flutter/material.dart';
import 'package:api_sustainability/data/my_colors.dart';
import 'package:api_sustainability/widgets/my_text.dart';
import '../widgets/app_drawer.dart';

class MarketPlaceScreen extends StatefulWidget {
  // @override
  // MarketPlaceScreen();

  @override
  MarketPlaceScreenState createState() => new MarketPlaceScreenState();
}

class MarketPlaceScreenState extends State<MarketPlaceScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroller) {
          return <Widget>[
            SliverAppBar(
              brightness: Brightness.dark,
              title: Text('Basic'),
              pinned: true,
              floating: true,
              backgroundColor: MyColors.primary,
              forceElevated: innerBoxIsScroller,
              // leading: IconButton(
              //     icon: const Icon(Icons.menu),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ), // overflow menu
                PopupMenuButton<String>(
                  onSelected: (String value) {},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: "Settings",
                      child: Text("Settings"),
                    ),
                  ],
                )
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 4,
                tabs: [
                  Tab(icon: Text("ITEM ONE")),
                  Tab(icon: Text("ITEM TWO")),
                  Tab(icon: Text("ITEM THREE")),
                ],
                controller: _tabController,
              ),
            )
          ];
        },
        body: TabBarView(
          children: [
            Align(child: Text("Section : 1", style: MyText.display1(context))),
            Align(child: Text("Section : 2", style: MyText.display1(context))),
            Align(child: Text("Section : 3", style: MyText.display1(context))),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
