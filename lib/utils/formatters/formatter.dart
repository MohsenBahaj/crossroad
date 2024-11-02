import 'package:intl/intl.dart';

class AppFormatter {
  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatPhoneNumber(String phoneNumber) {
    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(4, 7)} ${phoneNumber.substring(7)}';
    }
    return phoneNumber;
  }

  // static String internationalFormatPhoneNumber(String phoneNumber) {
  //   var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), "");
  //   String countryCode = '+${digitsOnly.substring(0, 2)}';

  //   final formattedNumber = StringBuffer();
  //   formattedNumber.write('($countryCode)');
  //   int i = 0;
  //   while (i < digitsOnly.length) {
  //     int groupLength = 2;
  //     for(i==0&&countryCode== '+1'){
  //       groupLength=3;
  //     }
  //   }
  // }
}
