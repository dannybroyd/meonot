import 'package:our_app/util/resources/importss.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  String e = "einstein";
  String b= "broshim";
  List<String> all_buildings = ["A","B","C","D","E","F","G","H","I","J","K"];
  List<String> all_floors = ["-1","0","1","2","3","4","5","6","7","8","9","10","11", "12","13","14","15","G","ROOF"];

  String? pickPlease(String? val){  // for validation of frop down field
    if(val==null || val.isEmpty){
        return "בחר אופציה";
      }
      return null;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(text: "הפרופיל שלי", middle: true,),
        body: Padding(padding:  const EdgeInsets.all(30),
         child: FormBuilder(
          key: _formKey,
          child: ListView(
          children: [
            MainFormField(
              name: "name",
              hintText: 'שם',
              initalValue: myProfile.name,
              validator:(val){return ourValidator(validEngAndHeb, val, " השם אינו תקין ");}
            ),
            MainFormField(
              name: "id",
              hintText: 'תעודת זהות',
              initalValue: myProfile.id,
              keyboardType: TextInputType.number,
              validator:(val){return ourValidator(validId, val, "ת.ז אינה תקינה");}
            ),
            MainFormField(
              name: "phone",
              hintText: 'טלפון',
              initalValue: myProfile.phone,
              keyboardType: TextInputType.phone,
              validator:(val){return ourValidator(validPhone, val, " מספר הטלפון אינו תקין ");}
            ),
            DropDownF(
              name: "meonot",
              hintText:"מעונות" ,
              initalValue: myProfile.dorms,
              validator: pickPlease,
              lst: const ["broshim", "einstein"],
              ),
            DropDownF(
              name: "building",
              hintText:"בניין" ,
              initalValue: myProfile.building,
              validator: pickPlease,
              lst: all_buildings,
              ),
            DropDownF(
              name: "floor",
              hintText:"קומה",
              initalValue: myProfile.floor,
              validator: pickPlease,
              lst: all_floors,         
              ),
            MainFormField(
              name: "appartment",
              hintText: 'מספר דירה',
              initalValue: myProfile.appartment,
              keyboardType: TextInputType.number,
              validator:(val){return ourValidator(validNumber, val, " מספר הדירה אינו תקין ");}
            ),
             const SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
              setState(() {   
                if(_formKey.currentState!.validate()){
                  myProfile.name = _formKey.currentState!.fields['name']!.value;
                  myProfile.id = _formKey.currentState!.fields['id']!.value;
                  myProfile.phone = _formKey.currentState!.fields['phone']!.value;
                  myProfile.dorms = _formKey.currentState!.fields['meonot']!.value;
                  myProfile.building = _formKey.currentState!.fields['building']!.value;
                  myProfile.floor = _formKey.currentState!.fields['floor']!.value;
                  myProfile.appartment = _formKey.currentState!.fields['appartment']!.value;
                  myProfile.updateData();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("הפרטים נשמרו")));
                  Navigator.pushNamed(context, '/homepage');
                  }
              });  // saves the values
            },
            style: 
            ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))), child: const Text("שמירה")), 
            // TODO: make class of button, because we have same button in 3 different forms
          ],
         )),
        ),
      ),
    );
  }
}