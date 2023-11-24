
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
Widget message(bool deleteAll){
  if(deleteAll){
    return const Text('אם תצאו, נתוני המבקרים ימחקו, האם תרצו לצאת?');
  }
  return const Text('אם תצאו, נתוני המבקר האחרון ימחקו, האם תרצו לצאת?');
}
Future<bool> leaveProgress(context, bool removeAll) async{
  // warn user before he leaves page and loses progress
  final value = await showDialog<bool>(
    context: context,
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          content: message(removeAll),
          actions: <Widget>[
            TextButton(
              child: const Text('לא'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('כן, תצא'),
              onPressed: () {
                if (removeAll){
                  visitors = [];
                }
                else{
                  visitors.removeLast();
                }
                Navigator.of(context).pop(true);
              },
            ),
          ],
        ),
      );
    }
  );
  return Future.value(value);
}

