// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String tag = "/product-detail";
  final ProductModel product;
  const ProductDetailScreen({Key? key, required this.product})
    : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int counter = 0;

  var product2 = {
    "id": 1,
    "productName": "Complan Nutrition and Health Drink | 100% Milk Pro",
    "imageData":
        "https://parmashopktl.pythonanywhere.com/media/product_image/nut1.png",
    "shortDes":
        "Complan Nutrition and Health Drink Royale Chocolate is a scientifically designed nutrition and health drink .",
    "longDes":
        "Complan Nutrition and Health Drink Royale Chocolate is a scientifically designed nutrition and health drink with a clini",
    "mainPrice": 400,
    "afterDiscountPrice": 300,
    "category": "Nutrition",
    "isSale": true,
    "stock": 1,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.productName ?? "",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App Bar Done

              // Image
              Image.network(
                product2["imageData"].toString(),
                width: double.infinity,
                height: 500,
                fit: BoxFit.contain,
              ),

              // Title
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.blueAccent,
              ),
              Text(widget.product.productName!),

              // Short Des
              Text(widget.product.shortDes!),

              // Long Des
              Text(widget.product.longDes!),
              // counter - 12 +
              Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        counter--;
                        setState(() {});
                      },
                      icon: Icon(Icons.remove),
                    ),
                    Text(counter.toString()),
                    IconButton(
                      onPressed: () {
                        counter++;
                        setState(() {});
                      },
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              // Buy Now // button
            ],
          ),
        ),
      ),
    );
  }
}
