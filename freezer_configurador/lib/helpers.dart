import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

fieldFocusChange(
  BuildContext context,
  FocusNode currentFocus,
  FocusNode nextFocus,
) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

String getFormattedDate(DateTime date, {String format = 'dd/MM/yyyy'}) {
  if (date.year < 1900) {
    return "";
  }
  DateFormat formatter = DateFormat(format);
  return formatter.format(date);
}

String getFileExtension(String fileName) {
  var fileExtension = fileName.split(".");
  return fileExtension[fileExtension.length - 1];
}

DateTime getDateFromString(String strDate, {String format = 'dd/MM/yyyy'}) {
  if (strDate == '') {
    throw ArgumentError.notNull();
  }
  DateFormat formatter = DateFormat(format);
  return formatter.parse(strDate);
}

String getFormattedInt({required int number, String format = '#,##0'}) {
  var f = NumberFormat(format, "pt_BR");
  return f.format(number);
}

String getFormattedDouble(
    {required double number, String format = '#,##0.00'}) {
  var f = NumberFormat(format, "pt_BR");
  return f.format(number);
}

bool isNumeric(String s) {
  if (s == '') {
    return false;
  }
  final number = num.tryParse(s);
  if (number == null) {
    return false;
  }

  return true;
}

void showSnackBar(
    {required BuildContext context,
    required String texto,
    int duracaoEmSegundos = 1}) {
  final snackBar = SnackBar(
    duration: Duration(seconds: duracaoEmSegundos),
    content: Text(texto),
  );
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Future navigateTo(BuildContext context, Widget screen) {
  return Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => screen,
  ));
}
