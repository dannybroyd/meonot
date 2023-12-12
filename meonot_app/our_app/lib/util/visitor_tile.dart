import 'package:our_app/util/resources/importss.dart';

class VisitorTile extends StatelessWidget {
  const VisitorTile({super.key, required this.savedVisitor, isOverNight = true}) : _isOvernight = isOverNight;
  final Visitor savedVisitor;
  final bool _isOvernight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        visitors.add(savedVisitor);
        // goes to requestpage with info about savedvisitor
        if (_isOvernight){
          Navigator.pushNamed(context, '/overnightpage');
        }
        else{
          Navigator.pushNamed(context, '/visitorpage');
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