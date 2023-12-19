import 'package:our_app/util/resources/importss.dart';

class MaintenancePage extends StatefulWidget {
  const MaintenancePage({super.key});

  @override
  State<MaintenancePage> createState() => _MaintenancePageState();
}

class _MaintenancePageState extends State<MaintenancePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: const MyAppBar(
            text: "פנייה בנושא תחזוקה ",
            middle: true,
          ),
          floatingActionButton: BottomButton(
            onPressed: () {
              setState(() {
                if (_formKey.currentState!.validate()) {
                  maintenanceMessage =
                      _formKey.currentState!.fields['maintenance']!.value;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WebViewPage(
                          isOverNight: false,
                          isMaintenance: true,
                        ),
                      ));
                }
              });
            },
            label: "שליחת בקשה",
            icon: const Icon(Icons.send),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                const Center(
                    child: Text(
                  " :הפנייה שלי",
                  style: TextStyle(fontSize: 26),
                )),
                FormBuilder(
                    key: _formKey,
                    child: Container(
                      width: 50,
                      height: 800,
                      padding: const EdgeInsets.all(16.0),
                      child: FormBuilderTextField(
                        name: "maintenance",
                        validator: (val) {
                          return maintananceValidator(val, "לא הוזן קלט");
                        },
                        maxLength: 256,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(8),
                        ),
                        style: const TextStyle(fontSize: 25),
                        maxLines: 12,
                        minLines: 8,
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
