import 'package:flutter/material.dart';
import 'package:our_app/util/drop_down_field.dart';
import 'package:our_app/util/form_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfilePage> {
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
            lst: ["broshim", "ainstein"],
            onChanged: (val){}),
          MainFormField(
            hintText: 'Building',
            validator:(val){
              return null;
              }),
          MainFormField(
            hintText: 'Floor',
            validator:(val){
              return null;
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