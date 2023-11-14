import 'package:flutter/material.dart';

class DropDownF extends StatelessWidget {
  const DropDownF({
    super.key, 
    required this.hintText,
    required this.lst,
    required this.onChanged
  });
  
  final String hintText;
  final List<String> lst;
  final String? Function(String?)? onChanged;

  List<DropdownMenuItem<String>> _makeItems(List<String> lst){
    List<DropdownMenuItem<String>> lst2 = lst.map(
    (e) => DropdownMenuItem(value: e, child: Text(e))).toList();
    return lst2;

    }
  
  @override
  Widget build(BuildContext context) {  // making a select form field
    return Padding(
      padding: const EdgeInsets.all(16),
      child: DropdownButtonFormField(
        items: _makeItems(lst),
        onChanged: onChanged,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}