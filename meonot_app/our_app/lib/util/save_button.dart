import 'package:our_app/util/resources/importss.dart';

class saveButton extends StatefulWidget {
  const saveButton({super.key, required this.onPressed, required this.text});
  final String text;
  final void Function()? onPressed;

  @override
  State<saveButton> createState() => _saveButtonState();
}

class _saveButtonState extends State<saveButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(20, 60),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        widget.text,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
