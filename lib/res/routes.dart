// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/screens/home_page.dart';
import 'package:flutter_application_1/screens/new_screen.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';

Map<String, Widget Function(BuildContext)> getAppRoutes() {
  Map<String, Widget Function(BuildContext)> appRoutes = {
    //  AgentListScreen.routeName: (context) {
    //       var args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //       var listData = args['listData'] as List<AgentModel>;
    //       var caseModel = args['caseModel'] as CaseModel;

    //       return AgentListScreen(
    //         agents: listData,
    //         caseModel: caseModel,
    //       );
    //     },
    MyHomePage.tag: (context) {
      return MyHomePage();
    },
    NewScreen2.tag: (context) {
      var args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      String username = args["val1"];
      String password = args["val2"];
      return NewScreen2(passedUsername: username, passedPassword: password);
    },

    NewScreen.tag: (context) {
      var data =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      // {
      //. " "
      // }
      String username = data['username'];
      String password = data['password'];
      return NewScreen(username: username, password: password);
    },
    ProductDetailScreen.tag: (context) {
      var data = ModalRoute.of(context)!.settings.arguments as ProductModel;

      return ProductDetailScreen(product: data);
    },
  };
  return appRoutes;
}
