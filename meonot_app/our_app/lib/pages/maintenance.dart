import 'package:our_app/util/resources/importss.dart';
import 'package:http/http.dart' as http;
class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(text: "פנייה בנושא תחזוקה ", middle: true,),
      floatingActionButton: BottomButton(
        onPressed: () async { 
            http.Response response = await http.post(
            Uri.parse(siteUrl),         // url is in info Page
            body:makeDict("maintenance"),     // function is in resources/info 
          );
        },          
        //TODO: add button redirection!
        label: "שליחת בקשה",
        icon: const Icon(Icons.send),
      ),      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Center(
              child: Text(" :הפנייה שלי",style: TextStyle(fontSize: 26 ),)
              ),
            FormBuilder(
              child: Container(
                width: 50, height: 800,
                padding: const EdgeInsets.all(16.0),
                child: FormBuilderTextField(
                  name: "maintenance",
                  decoration: const InputDecoration(border: OutlineInputBorder(),contentPadding: EdgeInsets.all(8),),
                  style: const TextStyle(fontSize: 25),maxLines: 12, minLines: 8,
                  ),
              )
              )
            ],
        ),
      )
    );
  }
}