import 'package:our_app/util/resources/importss.dart';
import 'package:http/http.dart' as http;

class WebViewPage extends StatefulWidget {
  const WebViewPage(
      {super.key, required this.isOverNight, this.isMaintenance = false});
  final bool isOverNight;
  final bool isMaintenance;
  @override
  State<WebViewPage> createState() => _WebViewPageState();

  String _eventFinder() {
    if (isMaintenance) {
      return "MNT";
    }
    if (isOverNight) {
      return "VISITORS";
    }
    return "GUESTS";
  }
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool changed = false;
  late String event;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          visitors.clear();
          entranceDate = '';
          leaveDate = '';
          maintenanceMessage = '';
          Navigator.pushNamed(context, '/homepage');
        },
        child: Scaffold(
            appBar: const MyAppBar(
              text: "שליחת הבקשה",
              middle: true,
              isProfile: true,
            ),
            body: WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: siteUrl,
                onWebViewCreated: (controller) async {
                  webViewIndex = 0;
                  event = widget._eventFinder();
                  this.controller = controller;
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                            child: CircularProgressIndicator(
                          strokeWidth: 5,
                        ));
                      });
                  http.Response response = await http
                      .post(Uri.parse(apiUrl), body: {'id': myProfile.id});
                },
                onPageFinished: (siteUrl) async {
                  if (validDorms() == '2' && webViewIndex == 4){
                    // dorms are broshim, no need for side
                    webViewIndex++;
                  }
                  _doNextAction(controller, event);
                  if (webViewIndex == dropDownList.length + 1) {
                    controller.runJavascript(
                        'window.scrollTo(0, document.body.scrollHeight)');
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("אנא הזן את קוד האבטחה"),
                      duration: Duration(seconds: 3),
                    ));
                  }
                  webViewIndex++;
                })),
      ),
    );
  }
}

void _fillOutNight(WebViewController controller) {
  _elementValueChange(controller, 'ID_TB', myProfile.id);
  _elementValueChange(controller, 'EntranceDate_TB', entranceDate);
  _elementValueChange(controller, 'LeaveDate_TB', leaveDate);
  _elementValueChange(controller, 'GuestID_TB', visitors[0].id);
  _elementValueChange(controller, 'GuestName_TB', visitors[0].name);
  _elementValueChange(controller, 'GuestPhone_TB', visitors[0].phone);
}

void _fillOutProfile(WebViewController controller) {
  _elementValueChange(controller, 'FullName', myProfile.name);
  _elementValueChange(controller, 'Phone', myProfile.phone);
}

void _fillOutDay(WebViewController controller) {
  _elementValueChange(controller, 'ID_TB', myProfile.id);
  _elementValueChange(controller, 'EntranceDate_TB', entranceDate);
  _elementValueChange(controller, 'GuestID_TB', visitors[0].id);
  _elementValueChange(controller, 'GuestName_TB', visitors[0].name);
  _elementValueChange(controller, 'GuestPhone_TB', visitors[0].phone);
  if (visitors.length > 1) {
    _elementValueChange(controller, 'Guest2ID_TB', visitors[1].id);
    _elementValueChange(controller, 'Guest2Name_TB', visitors[1].name);
    _elementValueChange(controller, 'Guest2Phone_TB', visitors[1].phone);
  }
  if (visitors.length == 3) {
    _elementValueChange(controller, 'Guest3ID_TB', visitors[2].id);
    _elementValueChange(controller, 'Guest3Name_TB', visitors[2].name);
    _elementValueChange(controller, 'Guest3Phone_TB', visitors[2].phone);
  }
}

void _fillOutMaintenance(WebViewController controller) {
  controller.runJavascript(
      "document.getElementById('ProblemDesc').value='$maintenanceMessage'");
}

void _elementValueChange(WebViewController controller, id, value) {
  controller.runJavascript("document.getElementById('$id').value='$value'");
}

Future<void> _dropDownValueChange(
    WebViewController controller, id, value) async {
  await controller
      .runJavascript("document.getElementById('$id').value='$value'");
  await controller.runJavascript("document.getElementById('$id').onchange()");
  await Future.delayed(const Duration(milliseconds: 600));
}

Future<void> _fillValidUnitsInWeb(
    WebViewController controller, appartment) async {
  // js code to fill right value in web for dorm units
  await controller
      .runJavascript("""var units = document.getElementById('DropDownUnit');
    var alloptions = units.getElementsByTagName('option');
    for (var i = 0; i < alloptions.length; i++){
      if (alloptions[i].innerHTML == $appartment){
        units.value = alloptions[i].value;
      }
    }
    """);
  await controller
      .runJavascript("document.getElementById('DropDownUnit').onchange()");
  await Future.delayed(const Duration(milliseconds: 600));
}

String validDorms() {
  //on website 1 is einstein, 2 is broshim

  if (myProfile.dorms == "איינשטיין") {
    return "1";
  }
  return "2";
}

String validBuidling() {
  return validDorms() + myProfile.building;
}

String validFloor() {
  int floorNumber = int.parse(myProfile.floor);
  if (floorNumber > 9 || floorNumber == -1) {
    return validDorms() + myProfile.building + myProfile.floor;
  } else {
    //maybe add edgecase
    return "${validDorms()}${myProfile.building}0${myProfile.floor}";
  }
}

Future<void> _fillValidSide(WebViewController controller) async {
  if (validDorms() == '1') {
    //dorms are einstein, need side
    await _dropDownValueChange(controller, 'DropDownSide', myProfile.side);
  }
}

Future<void> _doNextAction(
    WebViewController controller, String event) async {
  if (webViewIndex < dropDownList.length) {
    // special cases
    if (webViewIndex == 0) {
      _fillOutProfile(controller);
    }
    if (webViewIndex == 3) {
      // this means we need to do units
      await _fillValidUnitsInWeb(controller, dropDownList[webViewIndex][0]);
    } else if (webViewIndex == 4) {
      // this means we need to do side
      await _fillValidSide(controller);
    } else {
      await _dropDownValueChange(
          controller, dropDownList[webViewIndex][0], dropDownList[webViewIndex][1]);
    }
    return;
  } else if (webViewIndex == dropDownList.length) {
    // this means we have to fill specific to fault category
    await _dropDownValueChange(controller, 'DropDownFaultCategory', event);
    return;
  } else if (webViewIndex == dropDownList.length + 1) {
    if (event == 'VISITORS') {
      _fillOutNight(controller);
    } else if (event == 'GUESTS') {
      _fillOutDay(controller);
    } else {
      _fillOutMaintenance(controller);
    }
    return;
  }
}
