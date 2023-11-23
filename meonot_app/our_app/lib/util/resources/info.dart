
import 'package:our_app/util/resources/importss.dart';
UserData myProfile = UserData();
final fieldListUser = ['name', 'phone', 'id', 'dorms', 'building', 'floor', 'appartment'];
List visitors = [];         // current visitors

// validator
final validEngAndHeb= RegExp(r'^[a-z A-Z \u0590-\u05FF\u200f\u200e ]+$'); // checks for hebrew or english
final validId = RegExp(r'^[0-9]{9}');   // checks for 9 nubmers in a row
final validPhone = RegExp(r'^(?:[0]9)?[0-9]{10}$');
final validNumber = RegExp(r'^[0-9]+$');

String? ourValidator(RegExp r,String? val, String text ){
  if (val == null || val.isEmpty || !r.hasMatch(val)) {
    return text;
  }
  return null;
}

