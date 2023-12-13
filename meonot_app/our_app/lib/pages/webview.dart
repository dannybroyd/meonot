import 'package:our_app/util/resources/importss.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.isOverNight,});
  final bool isOverNight;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool changed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: siteUrl,
        onWebViewCreated: (controller){
          this.controller = controller;
        },
        onPageFinished: (siteUrl) {
          if(widget.isOverNight && !changed){
            _fillOutNight(controller);
            changed = true;
          }
          else if(!changed){
            _fillOutDay(controller);
            changed = true;
          }
        }
      )
    );
  }
}

void _fillOutNight(WebViewController controller) async{
  _fillOutProfile(controller);
  _dropDownValueChange(controller, 'DropDownFaultCategory', 'VISITORS');
  await Future.delayed(const Duration(seconds: 1));
  _elementValueChange(controller, 'ID_TB', myProfile.id);
  _elementValueChange(controller,'EntranceDate_TB', entranceDate);
  _elementValueChange(controller,'LeaveDate_TB', leaveDate);
  _elementValueChange(controller, 'GuestID_TB', visitors[0].id);
  _elementValueChange(controller, 'GuestName_TB', visitors[0].name);
  _elementValueChange(controller, 'GuestPhone_TB', visitors[0].phone);
}

void _fillOutProfile(WebViewController controller) async{
  _elementValueChange(controller, 'FullName', myProfile.name);
  _elementValueChange(controller, 'Phone', myProfile.phone);
  _dropDownValueChange(controller, 'DormDropDown', _validDorms());
  await Future.delayed(const Duration(seconds: 1));
  _dropDownValueChange(controller, 'DropDownBuilding', _validBuidling());
  await Future.delayed(const Duration(seconds: 1));
  _dropDownValueChange(controller, 'DropDownFloor', _validFloor());
  await Future.delayed(const Duration(seconds: 1));
  _fillValidUnitsInWeb(controller, myProfile.appartment);
}

void _fillOutDay(WebViewController controller)async{
  _fillOutProfile(controller);
  await Future.delayed(const Duration(seconds: 1));
  _dropDownValueChange(controller, 'DropDownFaultCategory', 'GUESTS');
  await Future.delayed(const Duration(seconds: 1));
  _elementValueChange(controller,'ID_TB', myProfile.id);
  _elementValueChange(controller,'EntranceDate_TB', entranceDate);
  _elementValueChange(controller, 'GuestID_TB', visitors[0].id);
  _elementValueChange(controller, 'GuestName_TB', visitors[0].name);
  _elementValueChange(controller, 'GuestPhone_TB', visitors[0].phone);
  if(visitors.length>1){
  _elementValueChange(controller, 'Guest2ID_TB', visitors[1].id);
  _elementValueChange(controller, 'Guest2Name_TB', visitors[1].name);
  _elementValueChange(controller, 'Guest2Phone_TB', visitors[1].phone);
  }
  if(visitors.length==3){
  _elementValueChange(controller, 'Guest3ID_TB', visitors[2].id);
  _elementValueChange(controller, 'Guest3Name_TB', visitors[2].name);
  _elementValueChange(controller, 'Guest3Phone_TB', visitors[2].phone);
  }  
}

void _elementValueChange(WebViewController controller, id, value){
    controller.runJavascript("document.getElementById('$id').value='$value'");
  }

void _dropDownValueChange(WebViewController controller, id, value){
    controller.runJavascript("document.getElementById('$id').value='$value'");
    controller.runJavascript("document.getElementById('$id').onchange()");
  }

void _fillValidUnitsInWeb(WebViewController controller, appartment){
  // js code to fill right value in web for dorm units
  controller.runJavascript(
    """var units = document.getElementById('DropDownUnit');
    var alloptions = units.getElementsByTagName('option');
    for (var i = 0; i < alloptions.length; i++){
      if (alloptions[i].innerHTML == $appartment){
        units.value = alloptions[i].value;
      }
    }
    """);
    controller.runJavascript("document.getElementById('DropDownUnit').onchange()");
}

String _validDorms(){
    //on website 1 is einstein, 2 is broshim
    if (myProfile.dorms == "einstein"){
      return "1";
    }
    return "2";
  }

  String _validBuidling(){
    return _validDorms() + myProfile.building;
  }

  String _validFloor(){
    int floorNumber = int.parse(myProfile.floor);
    if (floorNumber > 9 || floorNumber == -1){
      return _validDorms() + myProfile.building + myProfile.floor;
    }
    else {
      //maybe add edgecase
      return "${_validDorms()}${myProfile.building}0${myProfile.floor}";
    }
  }
