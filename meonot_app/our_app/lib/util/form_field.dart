import 'package:our_app/util/resources/importss.dart';

class MainFormField extends StatelessWidget {
  const MainFormField({
    super.key,
    required this.name,
    required this.hintText,
    this.initalValue ="",
    this.validator,
    this.keyboardType = TextInputType.text,
    });

  final String hintText;
  final String name;
  final String? Function(String?)? validator;
  final String initalValue ;
  final TextInputType keyboardType;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderTextField(
        name: name,
        validator: validator,
        initialValue: initalValue,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(hintText) ,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

      ),
    );
  }
}

