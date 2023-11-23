import 'package:our_app/util/resources/importss.dart';

class VisitorRequestPage extends StatefulWidget {
  const VisitorRequestPage({super.key, required this.finalVisitor});
  final Visitor finalVisitor;

  @override
  State<VisitorRequestPage> createState() => _VisitorRequestPageState();
}

class _VisitorRequestPageState extends State<VisitorRequestPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "בחר תאריך", middle: true,),
        body: 
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: [
            const DatePicker(name: "entranceDate", hintText: "תאריך כניסה"),
            Text(visitors.toString()),

            ]),
        ),
      ),
    );
  }
}