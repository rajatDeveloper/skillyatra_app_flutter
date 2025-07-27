// MultiProvider(
//     providers: [ChangeNotifierProvider(create: (_) => Counter())],
//     child: const MyApp(),
//   ),

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/network/my_network.dart';

class MainProvider extends ChangeNotifier {
  // Services -> Network or firebase

  final myNetwork = MyNetwork();

  // State change
  List<ProductModel>? mainProduct; // blank or null

  // Function who change them

  void fetchProduct() async {
    // logic
    try {
      var res = await myNetwork.getAllProduct();

      res.handleResponse(
        onSuccess: () {
          mainProduct = res.data ?? [];
          notifyListeners();
        },
        onFailed: () {
          mainProduct = [];
          notifyListeners();
        },
      );
    } catch (e) {
      log("Error: ${e.toString()}");
    }
  }
}
