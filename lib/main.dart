import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:send_data_bw_pages/pages/MainPage.dart';
import 'package:send_data_bw_pages/store.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Store(),
        child: Consumer<Store>(
          builder: (ctx, store, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: MainPage(),
            );
          },
        ));
  }
}
