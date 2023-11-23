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
    return const Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: MyAppBar(text: "בחר תאריך", middle: true,),
      ),
    );
  }
}