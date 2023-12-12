import 'package:our_app/util/resources/importss.dart';

class OvernightRequestPage extends StatefulWidget {
  const OvernightRequestPage({super.key});

  @override
  State<OvernightRequestPage> createState() => _OvernightRequestPageState();
}

class _OvernightRequestPageState extends State<OvernightRequestPage> {
  final dateControllerEntrance = TextEditingController();
  final dateControllerLeave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
        floatingActionButton: BottomButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewPage(isOverNight: true,),));
            },         
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children:  [
            DatePicker(name: "entranceDate", hintText: "תאריך כניסה",controller: dateControllerEntrance,),
            DatePicker(name: "leaveDate", hintText: "תאריך יציאה", leave: true, controller: dateControllerLeave,),
            ]),
        ),
      ),
    );
  }
}