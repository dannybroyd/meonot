import 'package:our_app/util/resources/importss.dart';
import 'package:http/http.dart' as http;
class OvernightRequestPage extends StatefulWidget {
  const OvernightRequestPage({super.key, required this.finalVisitor});
  final Visitor finalVisitor;

  @override
  State<OvernightRequestPage> createState() => _OvernightRequestPageState();
}

class _OvernightRequestPageState extends State<OvernightRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
        floatingActionButton: BottomButton(
            onPressed: () async { 
                http.Response response = await http.post(
                Uri.parse(siteUrl),         // url is in info Page
                body:makeDict("sleep"),     // function is in resources/info 
              );
              print(makeDict("sleep"));
              print(response.body);
              visitors.clear();   
            },          
            //TODO: add button redirection
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: const [
            DatePicker(name: "entranceDate", hintText: "תאריך כניסה"),
            DatePicker(name: "leaveDate", hintText: "תאריך יציאה", leave: true),
            ]),
        ),
      ),
    );
  }
}