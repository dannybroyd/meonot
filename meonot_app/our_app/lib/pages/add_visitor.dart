import 'package:our_app/util/resources/importss.dart';

class AddVisitorPage extends StatefulWidget {
  const AddVisitorPage({super.key});

  @override
  State<AddVisitorPage> createState() => _AddVisitorPageState();
}

class _AddVisitorPageState extends State<AddVisitorPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            children:  [
              const MainFormField(name: "id",
              hintText: "תעודת זהות אורח",
              // TODO: validator
              ),
              const MainFormField(name: "name",
              hintText: "שם האורח", 
              // TODO: validator
              ),
              const MainFormField(name: "phone",
              hintText: "טלפון אורח",
              // TODO: validator
              ),
              // TODO: Add button for validation and saving
              ElevatedButton(onPressed: (){
                setState(() {
                final newVisitor = Visitor(
                  id: _formKey.currentState!.fields['id']!.value,
                  name: _formKey.currentState!.fields['name']!.value, 
                  phone: _formKey.currentState!.fields['phone']!.value);
                myProfile.visitors.add(newVisitor);
                myProfile.updateVisitors();
                });
              },
              style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))), 
              child: const Text("שמור והמשך"))
            ],
          ))
      ),
    );
  }
}