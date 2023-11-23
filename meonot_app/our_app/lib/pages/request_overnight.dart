import 'package:our_app/util/resources/importss.dart';

class OvernightRequestPage extends StatefulWidget {
  const OvernightRequestPage({super.key, required this.finalVisitor, bool isOvernight = false}) : _isOvernight = isOvernight ;
  final Visitor finalVisitor;
  final bool _isOvernight;

  @override
  State<OvernightRequestPage> createState() => _OvernightRequestPageState();
}

class _OvernightRequestPageState extends State<OvernightRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
        body: 
        ListView(children: const [
          DatePicker(name: "entranceDate", hintText: "תאריך כניסה"),
          DatePicker(name: "leaveDate", hintText: "תאריך יציאה", leave: true),
          ]),
      ),
    );
  }
}