import 'package:our_app/util/resources/importss.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage(
      {super.key, required this.isOverNight, this.isMaintenance = false});
  final bool isOverNight;
  final bool isMaintenance;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;
  bool changed = false;
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
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onPageFinished: (siteUrl) async {
                  if (!changed) {
                    changed = true;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                              child: CircularProgressIndicator(
                            strokeWidth: 5,
                          ));
                        });
                    if (widget.isOverNight && !widget.isMaintenance) {
                      await _fillOutNight(controller);
                    } else if (!widget.isMaintenance) {
                      await _fillOutDay(controller);
                    } else {
                      // maintenance
                      await _fillOutMaintenance(controller);
                    }
                    await Future.delayed(const Duration(milliseconds: 600));
                    controller.runJavascript(
                        'window.scrollTo(0, document.body.scrollHeight)');
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("אנא הזן את קוד האבטחה"),
                      duration: Duration(seconds: 3),
                    ));
                  }
                })),
      ),
    );
  }
}

Future<void> _fillOutNight(WebViewController controller) async {
  await _fillOutProfile(controller);
  await _dropDownValueChange(controller, 'DropDownFaultCategory', 'VISITORS');
  _elementValueChange(controller, 'ID_TB', myProfile.id);
  _elementValueChange(controller, 'EntranceDate_TB', entranceDate);
  _elementValueChange(controller, 'LeaveDate_TB', leaveDate);
  _elementValueChange(controller, 'GuestID_TB', visitors[0].id);
  _elementValueChange(controller, 'GuestName_TB', visitors[0].name);
  _elementValueChange(controller, 'GuestPhone_TB', visitors[0].phone);
  await Future.delayed(const Duration(milliseconds: 600));
}

Future<void> _fillOutProfile(WebViewController controller) async {
  _elementValueChange(controller, 'FullName', myProfile.name);
  _elementValueChange(controller, 'Phone', myProfile.phone);
  await _dropDownValueChange(controller, 'DormDropDown', _validDorms());
  await _dropDownValueChange(controller, 'DropDownBuilding', _validBuidling());
  await _dropDownValueChange(controller, 'DropDownFloor', _validFloor());
  await _fillValidUnitsInWeb(controller, myProfile.appartment);
  await _fillValidSide(controller);
  await Future.delayed(const Duration(seconds: 1));
}

Future<void> _fillOutDay(WebViewController controller) async {
  await _fillOutProfile(controller);
  await _dropDownValueChange(controller, 'DropDownFaultCategory', 'GUESTS');
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
  await Future.delayed(const Duration(seconds: 1));
}

Future<void> _fillOutMaintenance(WebViewController controller) async {
  await _fillOutProfile(controller);
  await _dropDownValueChange(controller, 'DropDownFaultCategory', 'MNT');
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

String _validDorms() {
  //on website 1 is einstein, 2 is broshim

  if (myProfile.dorms == "איינשטיין") {
    return "1";
  }
  return "2";
}

String _validBuidling() {
  return _validDorms() + myProfile.building;
}

String _validFloor() {
  int floorNumber = int.parse(myProfile.floor);
  if (floorNumber > 9 || floorNumber == -1) {
    return _validDorms() + myProfile.building + myProfile.floor;
  } else {
    //maybe add edgecase
    return "${_validDorms()}${myProfile.building}0${myProfile.floor}";
  }
}

Future<void> _fillValidSide(WebViewController controller) async {
  if (_validDorms() == '1') {
    //dorms are einstein, need side
    await _dropDownValueChange(controller, 'DropDownSide', myProfile.side);
  }
}
