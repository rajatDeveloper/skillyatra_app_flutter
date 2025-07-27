import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  //  {
  //       "id": 1,
  //       "productName": "",
  //       "shortDes": "",
  //       "longDes": "Complan Nutrition and Health Drink Royale Chocolate is a scientifically designed nutrition and health drink with a clini",
  //       "mainPrice": 400,
  //       "afterDiscountPrice": 300,
  //       "category": "Nutrition",
  //       "isSale": null,
  //       "stock": null
  //   },

  int? id;
  String? productName;
  String? shortDes;
  String? longDes;
  int? mainPrice;
  int? afterDiscountPrice;
  String? category;
  bool? isSale;
  int? stock;
  String? imageData;

  ProductModel({
    this.id,
    this.productName,
    this.shortDes,
    this.longDes,
    this.mainPrice,
    this.afterDiscountPrice,
    this.category,
    this.isSale,
    this.stock,
    this.imageData,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productName': productName,
      'shortDes': shortDes,
      'longDes': longDes,
      'mainPrice': mainPrice,
      'afterDiscountPrice': afterDiscountPrice,
      'category': category,
      'isSale': isSale,
      'stock': stock,
      'imageData': imageData,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      shortDes: map['shortDes'] != null ? map['shortDes'] as String : null,
      longDes: map['longDes'] != null ? map['longDes'] as String : null,
      mainPrice: map['mainPrice'] != null ? map['mainPrice'] as int : null,
      afterDiscountPrice:
          map['afterDiscountPrice'] != null
              ? map['afterDiscountPrice'] as int
              : null,
      category: map['category'] != null ? map['category'] as String : null,
      isSale: map['isSale'] != null ? map['isSale'] as bool : null,
      stock: map['stock'] != null ? map['stock'] as int : null,
      imageData: map['imageData'] != null ? map['imageData'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
