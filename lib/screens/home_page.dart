import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/new_screen.dart';
import 'package:flutter_application_1/utils/helpfull_functions.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:flutter_application_1/widgets/helping_function.dart';

// C -> Create -> Post
// R -> Read -> Get
// U -> Update -> PUT (full update) Patch ()
// D -> Delete -> Delete

class MyHomePage extends StatefulWidget {
  static const String tag = "/home-page";

  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String username = "";
  String password = "";
  TextEditingController userNameController = TextEditingController();

  XFile? image;

  String? localUsername;

  getMyVar() async {
    localUsername = await HelpfullFunctions.getLocalDataUsingKey(
      key: HelpfullFunctions.key,
    );
    log("LocalData: $localUsername");
    userNameController.text = localUsername ?? "NULL"; // ?? or == null

    setState(() {});
  }

  cameraImageFun() async {
    image = await HelpfullFunctions.pickImageFun(source: ImageSource.camera);

    // if (image == null) {
    //   HelpfullFunctions.showSnackBar(
    //     context,
    //     "Pls select image",
    //   );
    // }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getMyVar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(),
                height: double.infinity,
                width: double.infinity,
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image.network(
                        //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTc9APxkj0xClmrU3PpMZglHQkx446nQPG6lA&s",
                        //   height: 200,
                        //   width: 200,
                        // ),
                        TextField(),
                        SizedBox(height: 10),
                        // Form(
                        //   key: ,
                        //   child: TextFormField(
                        //     key: ,
                        //   ),
                        // ) ,
                        TextField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            hintText: "Enter your username",
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                          obscureText: true,
                          onChanged: (text) {
                            password = text;
                          },
                        ),
                        SizedBox(height: 30),

                        // Button
                        InkWell(
                          onTap: () {
                            // var mainUser = userNameController.text;
                            // showSnackBar(
                            //   context,
                            //   "Username: $username, password $password",
                            // );
                            // Normal Way
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return NewScreen2(
                            //         passedUsername: userNameController.text,
                            //         passedPassword: password,
                            //       );
                            //     },
                            //   ),
                            // );

                            // Navigator.push(
                            //   context,

                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return NewScreen(
                            //         username: username,
                            //         password: password,
                            //       );
                            //     },
                            //   ),
                            // );
                            // tag routing // Named Routing

                            // Navigator.pushNamed(
                            //   context,
                            //   NewScreen.tag,
                            //   arguments: {
                            //     "username": username,
                            //     "password": password,
                            //   },
                            // );

                            // Tag Routing

                            Navigator.pushNamed(
                              context,
                              NewScreen.tag,
                              arguments: {
                                "username": userNameController.text,
                                "password": password,
                              },
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(color: Colors.blue),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        // ElevatedButton(
                        //   style: ButtonStyle(
                        //     backgroundColor: WidgetStateColor.resolveWith(callback)
                        //   ),

                        //   onPressed: () {},
                        //   child: Text("Login"),
                        // ),

                        // Image picker logic
                        TextButton(
                          onPressed: () async {
                            image = await HelpfullFunctions.pickImageFun(
                              source: ImageSource.gallery,
                            );
                            setState(() {});
                          },
                          child: Text("Gallery"),
                        ),
                        TextButton(
                          onPressed: cameraImageFun,
                          child: Text("Camera"),
                        ),

                        // to show image
                        image == null
                            ? SizedBox()
                            : Image.file(File(image!.path)),

                        // TextField  // username
                        TextField(controller: userNameController),

                        // button
                        TextButton(
                          onPressed: () async {
                            // Save - using key
                            await HelpfullFunctions.addDataToLocal(
                              data: userNameController.text,
                              key: HelpfullFunctions.key,
                            );
                            // Optional
                            getMyVar();
                          },
                          child: Text("SaveData"),
                        ),

                        // Save my data

                        //  data saved->
                        // show Text(). Button Delete.
                        localUsername != null
                            ? TextButton(
                              onPressed: () async {
                                await HelpfullFunctions.deleteLocalDataUsingKey(
                                  key: HelpfullFunctions.key,
                                );

                                getMyVar();
                              },
                              child: Text("Delete"),
                            )
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
