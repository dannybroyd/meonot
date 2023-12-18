import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:our_app/util/resources/importss.dart';

class VisitorTile extends StatefulWidget {
  const VisitorTile(
      {super.key,
      required this.savedVisitor,
      required this.deleteFunction,
      isOverNight = true})
      : _isOvernight = isOverNight;
  final Visitor savedVisitor;
  final bool _isOvernight;
  final Function(BuildContext)? deleteFunction;

  @override
  State<VisitorTile> createState() => _VisitorTileState();
}

class _VisitorTileState extends State<VisitorTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (visitors.contains(widget.savedVisitor)) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return  Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      content: const Text("מבקר זה כבר נבחר"),
                      actions: <Widget>[
                       TextButton(onPressed: (){
                        Navigator.pop(context);
                       },
                      child: const Text("אישור")) 
                      ]
                    ),
                  );
                });
          }
          // goes to requestpage with info about savedvisitor
          else {
            visitors.add(widget.savedVisitor);
            if (widget._isOvernight) {
              Navigator.pushNamed(context, '/overnightpage');
            } else {
              Navigator.pushNamed(context, '/visitorpage');
            }
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [
            SlidableAction(
              onPressed: widget.deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(16),
            ),
          ]),
          child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              tileColor: Theme.of(context).colorScheme.surfaceVariant,
              leading: CircleAvatar(
                child: Text(
                  widget.savedVisitor.getInitials(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.savedVisitor.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
