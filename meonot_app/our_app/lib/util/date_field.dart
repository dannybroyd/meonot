import 'package:our_app/util/resources/importss.dart';

class DatePicker extends StatefulWidget {
  final String name;
  final String hintText;
  final String? Function(String?)? validator;

  const DatePicker({super.key, required this.name, required this.hintText, this.validator});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderDateTimePicker(
        name: widget.name,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days:30)),
        inputType: InputType.date,
        decoration: InputDecoration(
          label: Text(widget.hintText),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
        ),
      ),
    );
  }
}