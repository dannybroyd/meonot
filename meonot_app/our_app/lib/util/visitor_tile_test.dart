import 'package:our_app/util/resources/importss.dart';

class VisitorTileTest extends StatelessWidget {
  const VisitorTileTest({super.key, required this.savedVisitor, isOverNight = true}) : _isOvernight = isOverNight;
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
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tileColor: Theme.of(context).colorScheme.surfaceVariant,
          leading: CircleAvatar(
            child: Text(
              savedVisitor.getInitials(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(savedVisitor.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
          )
        ),
      ),
    );
  }
}