import 'package:our_app/util/resources/importss.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(),
        body: ListView(children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
            child: Center(child: Text("בחר את נושא הפנייה:",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
          ),
          MainButton(task: "לינה", routeName: '/sleeppage',),
          MainButton(task: "מבקרים", routeName: '/visitorpage',),
          MainButton(task: "תחזוקה", routeName: '/maintenancepage'),
          MainButton(task: "אתר המעונות", routeName: "https://meonot.shikunbinui.com/", link: true)
        ]),
      ),
    );
  }
}