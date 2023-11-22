import 'package:our_app/util/resources/importss.dart';

class VisitorTile extends StatefulWidget {
  const VisitorTile({super.key, required this.savedVisitor});
  final Visitor savedVisitor;

  @override
  State<VisitorTile> createState() => _VisitorTileState();
}

class _VisitorTileState extends State<VisitorTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
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
            child: Center(child: Text(widget.savedVisitor.name,
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