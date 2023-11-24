import 'package:our_app/util/resources/importss.dart';

class VisitorRequestPage extends StatefulWidget {
  const VisitorRequestPage({super.key, required this.finalVisitor});
  final Visitor finalVisitor;

  @override
  State<VisitorRequestPage> createState() => _VisitorRequestPageState();

  String printNames(){
    String result = '';
    for(Visitor visitor in visitors){
      result += '${visitor.name}, ';
    }
    return result;
  }
  }

class _VisitorRequestPageState extends State<VisitorRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,  
      child: WillPopScope(
        onWillPop: () async {
          Future<bool> temp = Future<bool>.value(false);
          setState(() {
            temp = leaveProgress(context, false);
          });
          return temp;
        },
        child: Scaffold(
          appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
          floatingActionButton: BottomButton(
            onPressed: (){},             //TODO ADD ON PRESSED
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
          body: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              const DatePicker(name: "entranceDate", hintText: "תאריך כניסה"),
              Text(widget.printNames()),
              ]),
          ),
        ),
      ),
    );
  }
}