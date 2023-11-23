import 'package:our_app/util/resources/importss.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});
  

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "פנייה בנושא לינה", middle: true,),
        floatingActionButton: SizedBox(
          width: 170,
          height: 56,
          child: FloatingActionButton.extended(
            onPressed: (){
              Navigator.pushNamed(context, '/addvisitorpage');
            },
            label: const Text(
              "מבקר חדש",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            icon: const Icon(Icons.add_circle_outline),
            backgroundColor: MyApp.mainColor,
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(25),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16,),
                    child: Text("מועדפים:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: myProfile.visitors.length,
                itemBuilder: (BuildContext context, int index) {
                  return VisitorTile(
                    savedVisitor: myProfile.visitors[index]);
                },
              ),
            ),
          ],
        ) 
      ),
    );
  }
}