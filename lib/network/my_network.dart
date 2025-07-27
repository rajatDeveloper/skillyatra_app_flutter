import 'dart:convert';

import 'package:flutter_application_1/base/base_service.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/network_new/api_const.dart';
import 'package:flutter_application_1/network_new/api_response.dart';
import 'package:flutter_application_1/network_new/network_manager.dart';
import 'package:flutter_application_1/network_new/network_request.dart';

class MyNetwork extends BaseService {
  // get all product

  Future<ApiResponse<List<ProductModel>?>> getAllProduct() async {
    NetworkRequest request = NetworkRequest(
      ApiConst.baseUrl,
      RequestMethod.get,
      headers: getHeaders(),
    );

    final result = await NetworkManager.instance.perform<List<ProductModel>?>(
      request,
    );

    if (result.json != null) {
      var userMap = result.json;
      result.data =
          userMap
              .map<ProductModel>(
                (json) => ProductModel.fromJson(jsonEncode(json)),
              )
              .toList();
    }
    return result;
  }
}
