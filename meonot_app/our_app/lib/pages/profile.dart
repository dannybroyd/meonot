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
    return meonot_all[meonot];
  }
   List<String> pickfloor() {
    return floors_all[meonot][floor];
   }

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
            key: const Key("meonot"),
            hintText:"meonot" ,
            lst: ["broshim", "einstein"],
            onChanged: (val){
              setState(() {
                meonot = val.toString();
              });
            }),
            DropDownF(
            hintText:"building" ,
            lst: pickBuilding(),
            onChanged: (val){
              setState(() {
              floor = val.toString().toLowerCase();
              });
            }),
          DropDownF(
            hintText:"floor" ,
            lst: pickfloor(),
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