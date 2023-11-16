import 'package:our_app/util/resources/importss.dart';

class MainFormField extends StatelessWidget {
  const MainFormField({
    super.key,
    required this.hintText,
    this.validator
    });

  final String hintText;

  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),

      ),
    );
  }
}

