import 'package:our_app/util/resources/importss.dart';
 

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _myBox = Hive.box('myUserSettings');
  String e = "einstein";
  String b = "broshim";
  List<String> all_buildings = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K"
  ];
  List<String> all_floors = [
    "-1",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "G",
    "ROOF"
  ];

  bool _checkBoxNotFull() {
    for (final f in fieldListUser) {
      if (_myBox.get(f) == null || _myBox.get(f) == '') {
        return true;
      }
    }
    return false;
  }

  String? pickPlease(String? val) {
    // for validation of frop down field
    if (val == null || val.isEmpty) {
      return "בחר אופציה";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopScope(
        canPop: !_checkBoxNotFull(),
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          _showCantLeave(context);
        },
        child: Scaffold(
          appBar: const MyAppBar(
            text: "הפרופיל שלי",
            middle: true,
            isProfile: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: FormBuilder(
                key: _formKey,
                child: ListView(
                  children: [
                    MainFormField(
                        name: "name",
                        hintText: 'שם',
                        initalValue: myProfile.name,
                        validator: (val) {
                          return ourValidator(
                              validEngAndHeb, val, " השם אינו תקין ");
                        }),
                    MainFormField(
                        name: "id",
                        hintText: 'תעודת זהות',
                        initalValue: myProfile.id,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return ourValidator(validId, val, "ת.ז אינה תקינה");
                        }),
                    MainFormField(
                        name: "phone",
                        hintText: 'טלפון',
                        initalValue: myProfile.phone,
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          return ourValidator(
                              validPhone, val, " מספר הטלפון אינו תקין ");
                        }),
                    DropDownField(
                      name: "meonot",
                      hintText: "מעונות",
                      initalValue: myProfile.dorms,
                      validator: pickPlease,
                      lst: const ["ברושים", "איינשטיין"],
                    ),
                    DropDownField(
                      name: "building",
                      hintText: "בניין",
                      initalValue: myProfile.building,
                      validator: pickPlease,
                      lst: all_buildings,
                    ),
                    DropDownField(
                      name: "floor",
                      hintText: "קומה",
                      initalValue: myProfile.floor,
                      validator: pickPlease,
                      lst: all_floors,
                    ),
                    MainFormField(
                        name: "appartment",
                        hintText: 'מספר דירה',
                        initalValue: myProfile.appartment,
                        keyboardType: TextInputType.number,
                        validator: (val) {
                          return ourValidator(
                              validNumber, val, " מספר הדירה אינו תקין ");
                        }),
                    DropDownField(
                        name: "side",
                        hintText: "צד (השאר ריק אם אין)",
                        lst: const ["ימין", "שמאל", ""],
                        initalValue: myProfile.side),
                    const SizedBox(
                      height: 20,
                    ),
                    saveButton(
                        onPressed: () {
                          setState(() {
                            if (_formKey.currentState!.validate()) {
                              myProfile.name =
                                  _formKey.currentState!.fields['name']!.value;
                              myProfile.id =
                                  _formKey.currentState!.fields['id']!.value;
                              myProfile.phone =
                                  _formKey.currentState!.fields['phone']!.value;
                              myProfile.dorms = _formKey
                                  .currentState!.fields['meonot']!.value;
                              myProfile.building = _formKey
                                  .currentState!.fields['building']!.value;
                              myProfile.floor =
                                  _formKey.currentState!.fields['floor']!.value;
                              myProfile.appartment = _formKey
                                  .currentState!.fields['appartment']!.value;
                              if (_formKey
                                      .currentState!.fields['side']!.value ==
                                  null) {
                                // dont want to insert null to database
                                myProfile.side = '';
                              } else {
                                myProfile.side = _formKey
                                    .currentState!.fields['side']!.value;
                              }
                              myProfile.updateData();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("הפרטים נשמרו")));
                              Navigator.pop(context);
                            }
                          }); // saves the values
                        },
                        text: "שמירה",
                        ),        
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

void _showCantLeave(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('סיימו למלא'),
          content: const Text(
            'אנא סיימו קודם למלא את הפרטים שלכם, ולאחר מכן תצאו',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('הבנתי'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
