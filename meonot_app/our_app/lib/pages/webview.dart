import 'package:our_app/util/resources/importss.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.isOverNight});
  final bool isOverNight;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController controller;

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
          if(widget.isOverNight){
            _fillOutNight(controller);
          }
          else{
            _fillOutDay(controller);
          }
        }
      )
    );
  }
}

void _fillOutNight(WebViewController controller){
  //_fillOutProfile(controller);
  //controller.runJavascript("document.getElementById('DropDownFaultCategory').value='VISITORS'");
  controller.runJavascript("document.getElementById('DropDownFaultCategory').options[פניות בנושא לינה]=true");
  controller.runJavascript("document.getElementById('DropDownFaultCategory').onchange()'");
  //controller.runJavascript("document.getElementById('ID_TB').value='${myProfile.id}'");
}

void _fillOutProfile(WebViewController controller){
  controller.runJavascript("document.getElementById('FullName').value='${myProfile.name}'");
  controller.runJavascript("document.getElementById('Phone').value='${myProfile.phone}'");
  controller.runJavascript("document.getElementById('DormDropDown').value='${myProfile.dorms}'");
  controller.runJavascript("document.getElementById('DropDownBuilding').value='${myProfile.building}'");
  controller.runJavascript("document.getElementById('DropDownFloor').value='${myProfile.floor}'");
  controller.runJavascript("document.getElementById('DropDownUnit').value='${myProfile.appartment}'");
}
void _fillOutDay(WebViewController controller)async{
  _fillOutProfile(controller);
  await Future.delayed(const Duration(seconds: 1));
  controller.runJavascript("document.getElementById('ID_TB').value='${myProfile.id}'");
  controller.runJavascript("document.getElementById('EntranceDate_TB').value='$entranceDate'");
  controller.runJavascript("document.getElementById('GuestID_TB').value='${visitors[0].id}'");
  controller.runJavascript("document.getElementById('GuestName_TB').value='${visitors[0].name}'");
  controller.runJavascript("document.getElementById('GuestPhone_TB').value='${visitors[0].phone}'");
  if(visitors.length>1){
  controller.runJavascript("document.getElementById('Guest2ID_TB').value='${visitors[1].id}'");
  controller.runJavascript("document.getElementById('Guest2Name_TB').value='${visitors[1].name}'");
  controller.runJavascript("document.getElementById('Guest2Phone_TB').value='${visitors[1].phone}'");
  }
  if(visitors.length==3){
  controller.runJavascript("document.getElementById('Guest3ID_TB').value='${visitors[2].id}'");
  controller.runJavascript("document.getElementById('Guest3Name_TB').value='${visitors[2].name}'");
  controller.runJavascript("document.getElementById('Guest3Phone_TB').value='${visitors[2].phone}'");
  }  
}
