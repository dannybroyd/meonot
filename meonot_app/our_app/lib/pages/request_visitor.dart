import 'package:our_app/util/resources/importss.dart';
class VisitorRequestPage extends StatefulWidget {
  const VisitorRequestPage({super.key});

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
  final dateController = TextEditingController();
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
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const WebViewPage(isOverNight: false,),));
              entranceDate = dateController.text;
            },       
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
          body: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(children: [
              DatePicker(name: "entranceDate", hintText: "תאריך כניסה", controller: dateController,),
              Text(widget.printNames()),
              ElevatedButton(
              onPressed: (){
                if(visitors.length <=2){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritesPage(isOvernight: false,),));
                }
                else{
                  showDialog(context: context, builder: (BuildContext context){
                    return const AlertDialog(
                      content: Text("הגעת למכסת המבקרים המקסימלית"),
                    );
                  });
                }
              },
              style:ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
              child: const Text("הוספת מבקר נוסף"))
              ]),
          ),
        ),
      ),
    );
  }
}