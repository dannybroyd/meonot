import 'package:intl/intl.dart';
import 'package:our_app/util/resources/importss.dart';

class DatePicker extends StatefulWidget {
  final String name;
  final String hintText;
  final String? Function(String?)? validator;
  final bool leave;
  final TextEditingController controller;

  const DatePicker({
    super.key,
    required this.name,
    required this.hintText,
    required this.controller,
    this.validator,
    this.leave = false,
  });

  DateTime _defualtDate() {
    if (leave) {
      return DateTime.now().add(const Duration(days: 1));
    }
    return DateTime.now();
  }

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: FormBuilderDateTimePicker(
        format: DateFormat('dd/MM/yyyy'),
        controller: widget.controller,
        name: widget.name,
        initialValue: widget._defualtDate(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)),
        inputType: InputType.date,
        decoration: InputDecoration(
            label: Text(widget.hintText),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
