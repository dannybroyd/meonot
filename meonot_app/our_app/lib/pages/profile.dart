import 'package:our_app/data/database.dart';
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
  
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: const MyAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 25,),
            const Text("הפרופיל שלי", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),),
            Expanded(
              child: Padding(padding:  const EdgeInsets.all(30),
               child: FormBuilder(
                key: _formKey,
                child: ListView(
                children: [
                  MainFormField(
                    name: "name",
                    hintText: 'שם',
                    initalValue: myProfile.name,
                    validator:(val){
                      if(val != null) {
                        return "ENTER VALID NAME";
                      }
                      return null;
                      }),
                  MainFormField(
                    name: "id",
                    hintText: 'תעודת זהות',
                    initalValue: myProfile.id,
                    validator:(val){
                      if(val != null) {
                        return "ENTER VALID NAME";
                      }
                      return null;
                      }),
                  MainFormField(
                    name: "phone",
                    hintText: 'טלפון',
                    initalValue: myProfile.phone,
                    validator:(val){
                      if(val != null) {
                        return "ENTER VALID PHONE";
                      }
                      return null;
                      }),
                    DropDownF(
                    name: "meonot",
                    hintText:"מעונות" ,
                    initalValue: myProfile.dorms,
                    lst: const ["broshim", "einstein"],
                    onChanged: (val){
                      //TO DO
                      return null;
                    }),
                    DropDownF(
                    name: "building",
                    hintText:"בניין" ,
                    initalValue: myProfile.building,
                    lst: all_buildings,
                    onChanged: (val)
                    {
                      setState(() {
                        // TO Do
                      });
                      return null;
                    }),
                  DropDownF(
                    name: "floor",
                    hintText:"קומה",
                    initalValue: myProfile.floor,
                    lst: all_floors,         
                    onChanged: (val){
                      // TODO: function
                      return null;
                    }),
                  MainFormField(
                    name: "appartment",
                    hintText: 'מספר דירה',
                    initalValue: myProfile.appartment,
                    validator:(val){
                      return null;
                      }),
                   const SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: (){
                    setState(() {
                    myProfile.name = _formKey.currentState!.fields['name']!.value;
                    myProfile.id = _formKey.currentState!.fields['id']!.value;
                    myProfile.phone = _formKey.currentState!.fields['phone']!.value;
                    myProfile.dorms = _formKey.currentState!.fields['meonot']!.value;
                    myProfile.building = _formKey.currentState!.fields['building']!.value;
                    myProfile.floor = _formKey.currentState!.fields['floor']!.value;
                    myProfile.appartment = _formKey.currentState!.fields['appartment']!.value;
                    myProfile.updateData();
                    Navigator.pushNamed(context, '/homepage');
                    });  // saves the values
                  },
                  style: 
                  ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))), child: const Text("Submit")), 
                  // TODO: make class of button, because we have same button in 3 different forms
                ],
               )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}