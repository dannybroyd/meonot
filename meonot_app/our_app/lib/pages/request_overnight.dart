import 'package:our_app/util/resources/importss.dart';
import 'package:http/http.dart' as http;
class OvernightRequestPage extends StatefulWidget {
  const OvernightRequestPage({super.key, required this.finalVisitor});
  final Visitor finalVisitor;

  @override
  State<OvernightRequestPage> createState() => _OvernightRequestPageState();
}

class _OvernightRequestPageState extends State<OvernightRequestPage> {
  final dateController = TextEditingController();
  final dateController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
        floatingActionButton: BottomButton(
            onPressed: (){Navigator.pushNamed(context, '/webpage');},         
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children:  [
            DatePicker(name: "entranceDate", hintText: "תאריך כניסה",controller: dateController,),
            DatePicker(name: "leaveDate", hintText: "תאריך יציאה", leave: true, controller: dateController2,),
            ]),
        ),
      ),
    );
  }
}