import 'package:our_app/util/resources/importss.dart';

class DropDownField extends StatelessWidget {
  const DropDownField({
    super.key,
    required this.name,
    required this.hintText,
    required this.lst,
    required this.initalValue,
    this.validator,
  });

  final String name;
  final String hintText;
  final List<String> lst;
  final String? initalValue;
  final String? Function(String?)? validator;

  List<DropdownMenuItem<String>> _makeItems(List<String> lst) {
    List<DropdownMenuItem<String>> lst2 =
        lst.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList();
    return lst2;
  }

  @override
  Widget build(BuildContext context) {
    // making a select form field
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
      child: FormBuilderDropdown(
        name: name,
        items: _makeItems(lst),
        initialValue: initalValue,
        validator: validator,
        icon: const Icon(Icons.arrow_drop_down_circle_outlined),
        decoration: InputDecoration(
            label: Text(hintText),
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
