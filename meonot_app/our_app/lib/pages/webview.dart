import 'package:our_app/util/resources/importss.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.finalVisitor, required this.isOverNight});
  final Visitor finalVisitor;
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
          _fillOutNight(controller);
        }
      )
    );
  }
}

void _fillOutNight(WebViewController controller){
  _fillOutProfile(controller);
  controller.runJavascript("document.getElementById('DropDownFaultCategory').value='VISITORS'");
  controller.runJavascript("document.getElementById('ID_TB').value='${myProfile.id}'");
}

void _fillOutProfile(WebViewController controller){
  controller.runJavascript("document.getElementById('FullName').value='${myProfile.name}'");
<<<<<<< HEAD
}
void _fillOutDay(WebViewController controller){
  controller.runJavascript("document.getElementById('ID_TB').value='${myProfile.id}'");
  controller.runJavascript("document.getElementById('EntranceDate_TB').value='$entranceDate'");
=======
  controller.runJavascript("document.getElementById('Phone').value='${myProfile.phone}'");
  controller.runJavascript("document.getElementById('DormDropDown').value='${myProfile.dorms}'");
  controller.runJavascript("document.getElementById('DropDownBuilding').value='${myProfile.building}'");
  controller.runJavascript("document.getElementById('DropDownFloor').value='${myProfile.floor}'");
  controller.runJavascript("document.getElementById('DropDownUnit').value='${myProfile.appartment}'");
>>>>>>> 113c9b5d4c68caf26ec67935288594ce1584a1ba
}