import 'package:our_app/util/resources/importss.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _checktime(){
    //check time for greeting
    DateTime now = DateTime.now();
    int hours=now.hour;
    if(hours>=1 && hours<=12){ 
    return "Good Morning"; 
    } else if(hours>=12 && hours<=16){
     return "Good Afternoon"; 
    } else if(hours>=16 && hours<=21){ 
    return "Good Evening";
     } else {return "Good Night"; } 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text("${_checktime()}, Guest!", // TODO: change guest to name when doron does settings!
        style: const TextStyle(fontWeight: FontWeight.bold,
        fontSize: 22),
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/profilepage');
          }, 
          icon: const Icon(Icons.account_circle),
          iconSize: 36)
        ],
      ),
      body: ListView(children: const [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 15),
          child: Center(child: Text(":בחר את נושא הפנייה",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),)),
        ),
        MainButton(task: "לינה", routeName: '/sleeppage',),
        MainButton(task: "מבקרים", routeName: '/visitorpage',),
        MainButton(task: "תחזוקה", routeName: '/maintenancepage'),
        MainButton(task: "אתר המעונות", routeName: "https://meonot.shikunbinui.com/", link: true)
      ]),
    );
  }
}