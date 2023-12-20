import 'package:our_app/util/resources/importss.dart';

class AddVisitorPage extends StatefulWidget {
  const AddVisitorPage({super.key, bool isOvernight = true})
      : _isOvernight = isOvernight;
  final bool _isOvernight;

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
          appBar: const MyAppBar(
            text: "פרטי מבקר",
            middle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: FormBuilder(
                key: _formKey1,
                child: ListView(
                  children: [
                    MainFormField(
                      name: "id",
                      hintText: "תעודת זהות אורח",
                      validator: (val) {
                        return ourValidator(
                            validId, val, " התעודת זהות אינה תקינה");
                      },
                      keyboardType: TextInputType.number,
                    ),
                    MainFormField(
                      name: "name",
                      hintText: "שם האורח",
                      validator: (val) {
                        return ourValidator(
                            validEngAndHeb, val, " השם אינו תקין ");
                      },
                    ),
                    MainFormField(
                      name: "phone",
                      hintText: "טלפון אורח",
                      validator: (val) {
                        return ourValidator(
                            validPhone, val, " מספר הטלפון אינו תקין ");
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const MainCheckBox(
                        name: "checkBox",
                        title: Text("הוספה למועדפים",
                            style: TextStyle(fontSize: 16))),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: saveButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey1.currentState!.validate()) {
                              final savedVisitor = Visitor(
                                  id: _formKey1
                                      .currentState!.fields['id']!.value,
                                  name: _formKey1
                                      .currentState!.fields['name']!.value,
                                  phone: _formKey1
                                      .currentState!.fields['phone']!.value);
                              visitors.add(savedVisitor);
                              if (_formKey1
                                  .currentState!.fields['checkBox']!.value) {
                                // if you want to add to favorites
                                myProfile.favorites.add(savedVisitor);
                                myProfile.updateFavorites();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("פרטי האורח נשמרו")));
                              }
                              if (widget._isOvernight) {
                                Navigator.pushNamed(context, '/overnightpage');
                              } else {
                                Navigator.pushNamed(context, '/visitorpage');
                              }
                            }
                          });
                        },
                        text: "שמור והמשך",
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
