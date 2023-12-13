
import 'package:our_app/util/resources/importss.dart';
UserData myProfile = UserData();
final fieldListUser = ['name', 'phone', 'id', 'dorms', 'building', 'floor', 'appartment'];
List visitors = [];         // current visitors
String entranceDate="";

//String siteUrl ="http://127.0.0.1:5000/";         // put url
String siteUrl = "https://meonot.shikunbinui.com";

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
Future<bool> leaveProgress(context, bool removeAll, {bool goHomePage = false}) async{
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
                if(goHomePage){       // only if in favorites and want to go back to home page
                  Navigator.pushNamed(context, '/homepage');
                }
                else{ 
                Navigator.of(context).pop(true);
                }
              },
            ),
          ],
        ),
      );
    }
  );
  return Future.value(value);
}

// function to make a dict with the values we want to send to the server
Map<String, dynamic> makeDict(String category){     
  List<dynamic> visitors = myProfile.favorites;
  String dorm;
  if(myProfile.dorms =="broshim"){ 
    dorm = "2";
  }
  else{
    dorm = "1";
  }
  Map<String, dynamic> dataDict = {"fullname": myProfile.name, "user_id": myProfile.id, "phone": myProfile.phone, "dorm": dorm, "building": myProfile.building, "floor": myProfile.floor, "unit": myProfile.appartment,
  "category": category};
  if(visitors.length == 1){
    dataDict.addAll({"guest_id": visitors[0].id, "guest_name": visitors[0].name, "guest_phone": visitors[0].phone});
  }
  if(visitors.length == 2){
    dataDict.addAll({"guest_id2": visitors[1].id, "guest_name2": visitors[1].name, "guest_phone2": visitors[1].phone});
  }
  if(visitors.length == 3){
    dataDict.addAll({"guest_id3": visitors[2].id, "guest_name3": visitors[2].name, "guest_phone3": visitors[2].phone});
    }
  return dataDict;
}
