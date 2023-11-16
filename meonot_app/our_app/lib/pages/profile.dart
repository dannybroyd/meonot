import 'package:our_app/util/resources/importss.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfilePage> {
  String meonot = "broshim";
  String floor = "a";
  List<String> pickBuilding() {
    return meonot_allBuildings[meonot];
  }
   List<String> pickfloor() {
    return all_floors[meonot][floor];
   }
final GlobalKey _key = GlobalKey();
final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding:  const EdgeInsets.all(30),
       child: Form(
        key: _formKey,
        child: ListView(
        children: [
          MainFormField(
            hintText: 'Name',
            validator:(val){
              if(val != null) {
                return "ENTER VALID NAME";
              }
              return null;
              }),

          MainFormField(
            hintText: 'Phone',
            validator:(val){
              if(val != null) {
                return "ENTER VALID PHONE";
              }
              return null;
              }),
            DropDownF(
            hintText:"meonot" ,
            lst: ["broshim", "einstein"],
            onChanged: (val){
              setState(() {
                
                meonot = val.toString();
              });
              return null;
            }),
            DropDownF(
            key: _key,
            hintText:"building" ,
            lst: meonot_allBuildings[meonot],
            onChanged: (val){
              setState(() {
              floor = val.toString().toLowerCase();
              });
            }),
          DropDownF(
            hintText:"floor" ,
            lst: all_floors[meonot][floor],
            onChanged: (val){
              // TO DO function
            }),
          MainFormField(
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