import 'package:our_app/util/resources/importss.dart';
import 'package:our_app/util/visitor_tile_test.dart';

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
      child: WillPopScope(            // TODO: CHANGE TO POPSCOPE?
        onWillPop: () async {
          Future<bool> temp = Future<bool>.value(false);
          setState(() {
            temp = leaveProgress(context, true);
          });
          return temp;
        },
        child: Scaffold(
          appBar: MyAppBar(text: widget.textForAppbar(), middle: true,),
          floatingActionButton: BottomButton(
            onPressed: (){    // changes the isOvernight field so we will know if its a visitor or an overnight leach :)
              if(widget._isOvernight){
                Navigator.pushNamed(context, '/addvisitorpage');
                }
              else{
                // if not overnight, need to go to requestvisitor after addvisitor
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddVisitorPage(isOvernight: widget._isOvernight,),));
              }         
            },
            label: "מבקר חדש",
            icon: const Icon(Icons.add_circle_outline),
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
                    return VisitorTileTest(savedVisitor: myProfile.visitors[index],
                    isOverNight: widget._isOvernight,);
                    // return VisitorTile(
                    //   savedVisitor: myProfile.visitors[index],
                    //   isOvernight: widget._isOvernight,);
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