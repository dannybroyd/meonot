import 'package:our_app/util/resources/importss.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfilePage> {
  String meonot = "broshim";
  String floor = "a";

  // not usful now haha 
  List<String> pickBuilding() {
    return meonot_allBuildings[meonot];
  }
   List<String> pickfloor() {
    return all_floors[meonot][floor];
   }
  
final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:  const EdgeInsets.all(30),
       child: FormBuilder(
        key: _formKey,
        child: ListView(
        children: [
          MainFormField(
            name: "name",
            hintText: 'Name',
            validator:(val){
              if(val != null) {
                return "ENTER VALID NAME";
              }
              return null;
              }),

          MainFormField(
            name: "phone",
            hintText: 'Phone',
            validator:(val){
              if(val != null) {
                return "ENTER VALID PHONE";
              }
              return null;
              }),
            DropDownF(
            name: "meonot",
            hintText:"meonot" ,
            lst: ["broshim", "einstein"],
            onChanged: (val){
              setState(() {
                meonot = val.toString();
              });
              return null;
            }),
            DropDownF(
            name: "building",
            hintText:"building" ,
            lst: meonot_allBuildings[meonot],
            onChanged: (val){
              setState(() {
              floor = val.toString().toLowerCase();
              });
            }),
          DropDownF(
            name: "floor",
            hintText:"floor" ,
            lst: all_floors[meonot][floor],
            onChanged: (val){
              // TO DO function
            }),
          MainFormField(
            name: "appartment",
            hintText: 'Appartment',
            validator:(val){
              return null;
              }),
           const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){} ,style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))), child: const Text("Submit")), 
        ],

       )),
      ),
    );
  }
  
 
  

}