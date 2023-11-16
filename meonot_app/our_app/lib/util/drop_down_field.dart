import 'package:our_app/util/resources/importss.dart';

class DropDownF extends StatefulWidget {
  const DropDownF({
    super.key, 
    required this.name,
    required this.hintText,
    required this.lst,
    required this.onChanged,
  });
  
  final String name;
  final String hintText;
  final List<String> lst;
  final String? Function(String?)? onChanged;



  @override
  State<DropDownF> createState() => _DropDownFState();
}

class _DropDownFState extends State<DropDownF> {
  List<DropdownMenuItem<String>> _makeItems(List<String> lst){
    List<DropdownMenuItem<String>> lst2 = lst.map(
    (e) => DropdownMenuItem(value: e, child: Text(e))).toList();
    return lst2;
    }

  @override
  Widget build(BuildContext context) {  // making a select form field
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderDropdown(
        name: name,
        items: _makeItems(widget.lst),
        onChanged: widget.onChanged,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }
}