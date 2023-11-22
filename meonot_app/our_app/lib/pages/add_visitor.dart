import 'package:our_app/util/resources/importss.dart';

class AddVisitorPage extends StatefulWidget {
  const AddVisitorPage({super.key});

  @override
  State<AddVisitorPage> createState() => _AddVisitorPageState();
}

class _AddVisitorPageState extends State<AddVisitorPage> {
  final _formKey1 = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FormBuilder(
          key: _formKey1,
          child: ListView(
            children:  [
              MainFormField(name: "id",
              hintText: "תעודת זהות אורח",
              validator: (val){return ourValidator(validId, val, " התעודת זהות אינה תקינה");},
              keyboardType: TextInputType.number,
              ),
              MainFormField(name: "name",
              hintText: "שם האורח", 
              validator: (val){return ourValidator(validEngAndHeb, val, " השם אינו תקין ");},
              ),
              MainFormField(name: "phone",
              hintText: "טלפון אורח",
              validator: (val){return ourValidator(validPhone, val, " מספר הטלפון אינו תקין ");},
              keyboardType: TextInputType.phone,
              ),
              ElevatedButton(onPressed: ()
              {
                setState(() {
                  if(_formKey1.currentState!.validate()){
                    final newVisitor = Visitor(
                      id: _formKey1.currentState!.fields['id']!.value,
                      name: _formKey1.currentState!.fields['name']!.value, 
                      phone: _formKey1.currentState!.fields['phone']!.value);
                      myProfile.visitors.add(newVisitor);
                      myProfile.updateVisitors();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("פרטי האורח נשמרו")));
                      Navigator.pushNamed(context, '/requestpage');
                    }
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