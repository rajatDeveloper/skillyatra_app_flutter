import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';
import 'package:flutter_application_1/utils/helpfull_functions.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          Image.network(
            product.imageData ?? "",
            width: HelpfullFunctions.getDeviceWidth(context) * 0.4, // 1000
            height: HelpfullFunctions.getDeviceHeight(context) * 0.05,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15),

          Expanded(
            child: Column(
              children: [
                Text(
                  product.productName ?? "N/A",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Rs. ${product.mainPrice.toString() ?? "N/A"}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ProductDetailScreen.tag,
                          arguments: product,
                        );
                      },
                      child: Text("View Detail"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
