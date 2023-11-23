import 'package:our_app/util/resources/importss.dart';

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
                  style: TextStyle(fontSize: 25),maxLines: 12, minLines: 8,
                  ),
              )
              )
            ],
        ),
      )
    );
  }
}