import 'package:our_app/util/resources/importss.dart';

class VisitorTile extends StatelessWidget {
  const VisitorTile({super.key, required this.savedVisitor, bool isOvernight = true}) : _isOvernight = isOvernight;
  final Visitor savedVisitor;
  final bool _isOvernight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // goes to requestpage with info about savedvisitor
        if (_isOvernight){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OvernightRequestPage(finalVisitor: savedVisitor),));
        }
        else{
          visitors.add(savedVisitor);
          Navigator.push(context, MaterialPageRoute(builder: (context) => VisitorRequestPage(finalVisitor: savedVisitor),));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        child: Container(
          decoration: BoxDecoration(
            color: MyApp.mainColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(child: Text(savedVisitor.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),)),
          ),
        ),
      ),
    );
  }
}