import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/models/product_model.dart';
import 'package:flutter_application_1/network/my_network.dart';
import 'package:flutter_application_1/network/network_service.dart';
import 'package:flutter_application_1/provider/main_provider.dart';
import 'package:flutter_application_1/utils/helpfull_functions.dart';
import 'package:flutter_application_1/widgets/product_card.dart';
import 'package:provider/provider.dart';

class NewScreen extends StatefulWidget {
  static const String tag = "/new-screen";
  final String username;
  final String password;

  //

  const NewScreen({super.key, required this.username, required this.password});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  // loadData() async {
  //   // data = await NetworkService().fetchProductList();
  //   // Netork Manager
  //   MyNetwork myNetwork = MyNetwork();

  //   try {
  //     var res = await myNetwork.getAllProduct();
  //     // data load ->
  //     // data load not ->
  //     // State
  //     // Success
  //     // Failed
  //     // Loading
  //     //
  //     res.handleResponse(
  //       onSuccess: () {
  //         data = res.data;
  //         // http
  //         // state ->
  //         // 1 Provider ,  Medium
  //         // 2 B-loc , Big
  //         // RiverPod
  //         setState(() {}); // -> whole screen
  //       },
  //       onFailed: () {
  //         log(res.error?.errorMsg ?? "");
  //       },
  //     );
  //   } catch (error) {
  //     log(error.toString());
  //   }
  // }

  List<ProductModel> staticList = [
    ProductModel(productName: "Test1"),
    ProductModel(productName: "Test2"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var provider = context.read<MainProvider>();

    provider.fetchProduct();
  }

  //
  var screenSize = 1000;

  var tabScreenSize = 2000;

  void data() {
    if (screenSize > tabScreenSize) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Consumer<MainProvider>(
            builder: (context, mainProvider, _) {
              if (mainProvider.mainProduct == null) {
                return Center(child: CircularProgressIndicator());
              } else if (mainProvider.mainProduct!.isEmpty) {
                return Center(child: Text("Blank List "));
              }
              return Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_sharp),
                      ),
                    ],
                  ),
                  Text(
                    "Username: ${widget.username} , Password: ${widget.password}",
                  ),

                  // Text(data?.length.toString() ?? "0"),

                  // List / Grid

                  // true/false ?  T Run :  F Run
                  // data == null
                  //     ? CircularProgressIndicator(color: Colors.brown)
                  //     : Text(data?.length.toString() ?? "0"),

                  // // Static ->
                  // SizedBox(
                  //   height: 300,
                  //   child: ListView(
                  //     // scrollDirection: Axis.,
                  //     children: [
                  //       Text(staticList[0].productName ?? ""),
                  //       Text(staticList[1].productName ?? ""),
                  //     ],
                  //   ),
                  // ),
                  // data == null
                  //     ? CircularProgressIndicator()
                  //     : SizedBox(
                  //       height: 500,
                  //       child: ListView.builder(
                  //         itemCount: data?.length ?? 0,
                  //         itemBuilder: (context, index) {
                  //           return ProductCard(product: data![index]);
                  //         },
                  //       ),
                  //     ),
                  // GridView(
                  //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 2, // 2 items per row
                  //     mainAxisSpacing: 2,
                  //     crossAxisSpacing: 2,
                  //     childAspectRatio: 3 / 4,
                  //   ),
                  //   children: [

                  //   ],
                  // ),
                  SizedBox(
                    height:
                        HelpfullFunctions.getDeviceHeight(context) * 0.7, // 70%
                    child: GridView.builder(
                      itemCount: mainProvider.mainProduct!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // 2 items per row
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 2,
                            childAspectRatio: 3 / 4,
                          ),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: mainProvider.mainProduct![index],
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class NewScreen2 extends StatefulWidget {
  static const String tag = "/second-screen2";
  final String passedUsername;
  final String passedPassword;
  const NewScreen2({
    super.key,
    required this.passedUsername,
    required this.passedPassword,
  });

  @override
  State<NewScreen2> createState() => _NewScreen2State();
}

class _NewScreen2State extends State<NewScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Second Screen")),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Username: ${widget.passedUsername}, Password: ${widget.passedPassword}",
            ),
          ],
        ),
      ),
    );
  }
}
