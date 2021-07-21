import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './providers/products.dart';
import './providers/meta.dart';

import './providers/auth.dart';

import './helpers/custom_route.dart';

import 'screens/admin_screen.dart';
import 'screens/edit_item_screen.dart';
import './screens/splash_screen.dart';
import './screens/auth_screen.dart';
import './screens/tracker_screen.dart';
import './screens/market_place_screen.dart';
import './screens/profile_screen.dart';
import './screens/request_product.dart';

import './screens/about_screen.dart';
import './screens/credits_screen.dart';

import './screens/contact_us_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Products>(
            update: (ctx, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items,
            ),
          ),
          ChangeNotifierProvider.value(
            // value: Cart(),
            value: Meta(
                name: "Demo User",
                dayCount: 1,
                lastDateSync: DateTime.parse('2021-04-12 00:05:41.446919')),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'OffSet',
              theme: ThemeData(
                  primarySwatch: Colors.green,
                  accentColor: Colors.green,
                  fontFamily: 'Lato',
                  pageTransitionsTheme: PageTransitionsTheme(builders: {
                    TargetPlatform.android: CustomPageTransitionBuilder(),
                    TargetPlatform.iOS: CustomPageTransitionBuilder(),
                  })),
              home: auth.isAuth
                  ? MarketPlaceScreen()
                  : FutureBuilder(
                      future: auth.tryAutoLogin(),
                      builder: (ctx, authResultSnapshot) =>
                          authResultSnapshot.connectionState ==
                                  ConnectionState.waiting
                              ? SplashScreen()
                              : AuthScreen(),
                    ),
              routes: {
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                EditProductScreen.routeName: (ctx) => EditProductScreen(),
                TrackerScreen.routeName: (ctx) => TrackerScreen(),
                ProfileScreen.routeName: (ctx) => ProfileScreen(),
                RequestFeatureScreen.routeName: (ctx) => RequestFeatureScreen(),
                AboutScreen.routeName: (ctx) => AboutScreen(),
                ContactUsScreen.routeName: (ctx) => ContactUsScreen(),
                CreditsScreen.routeName: (ctx) => CreditsScreen(),
              }),
        ));
  }
}
