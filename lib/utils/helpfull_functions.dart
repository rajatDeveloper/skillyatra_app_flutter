import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelpfullFunctions {
  static final String key = "userName";
  // To Get Height of system

  static double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  // To Get Width of system
  static double getDeviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // snack bar
  static void showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text, style: const TextStyle(color: Colors.red)),
        backgroundColor: Colors.yellow,
      ),
    );
  }

  // Image Picker

  File? image;

  static Future<XFile?> pickImageFun({required ImageSource source}) async {
    try {
      //

      final imagePicker = ImagePicker();

      var image = await imagePicker.pickImage(source: source);

      return image;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Local Storage

  // Read

  static Future<String?> getLocalDataUsingKey({required String key}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var res = await prefs.getString(key);

      return res;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Delete

  static Future<bool> deleteLocalDataUsingKey({required String key}) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var res = await prefs.remove(key);

      return res;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // Add

  static Future<bool> addDataToLocal({
    required String data,
    required String key,
  }) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var res = await prefs.setString(key, data);
      return res;
    } catch (e) {
      print(e.toString());

      return false;
    }
  }
}
