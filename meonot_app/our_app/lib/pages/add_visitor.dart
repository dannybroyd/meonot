import 'package:our_app/util/date_field.dart';
import 'package:our_app/util/resources/importss.dart';

class AddVisitorPage extends StatefulWidget {
  const AddVisitorPage({super.key});

  @override
  State<AddVisitorPage> createState() => _AddVisitorPageState();
}

class _AddVisitorPageState extends State<AddVisitorPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            children: const [
              MainFormField(name: "id",
              hintText: "תעודת זהות אורח",
              // TODO: validator
              ),
              MainFormField(name: "name",
              hintText: "שם האורח", 
              // TODO: 
              ),
              MainFormField(name: "phone",
              hintText: "טלפון אורח",
              // TODO: validator
              ),
              DatePicker(name: "entranceDate",
              hintText: "תאריך הגעה"
              ),
              DatePicker(name: "leaveDate",
              hintText: "תאריך עזיבה",
              // TODO: validator
              )
              // TODO: Add button for validation and saving
            ],
          ))
      ),
    );
  }
}