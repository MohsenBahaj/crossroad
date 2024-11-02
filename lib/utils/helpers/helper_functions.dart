import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHelperFunctions {
  static Color? getColor(String colorName) {
    if (colorName.toLowerCase() == 'red') {
      return Colors.red;
    } else if (colorName.toLowerCase() == 'green') {
      return Colors.green;
    } else if (colorName.toLowerCase() == 'grey') {
      return Colors.grey;
    } else if (colorName.toLowerCase() == 'white') {
      return Colors.white;
    } else if (colorName.toLowerCase() == 'purple') {
      return Colors.purple;
    } else if (colorName.toLowerCase() == 'blue') {
      return Colors.blue;
    } else if (colorName.toLowerCase() == 'yellow') {
      return Colors.yellow;
    } else if (colorName.toLowerCase() == 'orange') {
      return Colors.orange;
    } else if (colorName.toLowerCase() == 'brown') {
      return Colors.brown;
    } else if (colorName.toLowerCase() == 'teal') {
      return Colors.teal;
    } else if (colorName.toLowerCase() == 'indigo') {
      return Colors.indigo;
    } else if (colorName.toLowerCase() == 'pink') {
      return Colors.purple;
    } else if (colorName.toLowerCase() == 'black') {
      return Colors.black;
    }
    return null;
  }

  static showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    // Check if the URL can be launched
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Handle the error appropriately (e.g., show a message to the user)
    }
  }

  static showAlert(String title, String message) {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [TextButton(onPressed: () {}, child: const Text('Ok'))],
          );
        });
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getForamttedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(
        children: rowChildren,
      ));
    }
    return wrappedList;
  }
}
