import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider/main_provider.dart';
import 'package:flutter_application_1/res/routes.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:provider/provider.dart';
// by main 
void main() => runApp(
  MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => MainProvider())],
    child: const MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: getAppRoutes(),
      initialRoute: MyHomePage.tag,

      // home: MyHomePage(),
      theme: ThemeData(colorSchemeSeed: Colors.blue),
    );
  }
}

//

// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
