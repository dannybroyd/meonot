import 'package:our_app/pages/add_visitor.dart';
import 'package:our_app/util/resources/importss.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key, bool isOvernight = true}) : _isOvernight = isOvernight;
  final bool _isOvernight;
  
  String textForAppbar(){
    if (_isOvernight){
      return "פנייה בנושא לינה";
    }
    return "פנייה בנושא מבקרים";
  }

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () async {
          Future<bool> temp = Future<bool>.value(false);
          setState(() {
            temp = leaveProgress(context, true);
          });
          return temp;
        },
        child: Scaffold(
          appBar: MyAppBar(text: widget.textForAppbar(), middle: true,),
          floatingActionButton: SizedBox(
            width: 170,
            height: 56,
            child: FloatingActionButton.extended(
              onPressed: (){
                if(widget._isOvernight){
                  Navigator.pushNamed(context, '/addvisitorpage');
                  }
                else{
                  // if not overnight, need to go to requestvisitor after addvisitor
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddVisitorPage(isOvernight: widget._isOvernight,),));
                  }
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
                      savedVisitor: myProfile.visitors[index],
                      isOvernight: widget._isOvernight,);
                  },
                ),
              ),
            ],
          ) 
        ),
      ),
    );
  }
}