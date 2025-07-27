// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_application_1/models/product_model.dart';

class NetworkService {
  Future<List<ProductModel>> fetchProductList() async {
    final uri = Uri.parse(
      'https://parmashopktl.pythonanywhere.com/api/products/',
    ); // Replace with actual endpoint

    final response = await http.get(uri);
    // List<int> intData = [1, 2, 3, 4];
    // int sum = 0;
    // intData.map((intItem) {
    //   sum += intData; // sum = sum + intData
    // });

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);

      var ans = data.map((item) => ProductModel.fromMap(item)).toList();

      return ans;
    } else {
      throw Exception('Failed to load products');
    }
  }
}

// Order
// List<Product>
// Address
// paymentDetails

// C -> Create -> Post
// R -> Read -> Get
// U -> Update -> PUT (full update) Patch ()
// D -> Delete -> Delete

class Order {
  List<Product>? products;
  Address? address;
  PaymentDetails? paymentDetails;

  Order({this.products, this.address, this.paymentDetails});
}

class Product {
  String? name;
}

class Address {
  int? pinCode;
}

class PaymentDetails {}
