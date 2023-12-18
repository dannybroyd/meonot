import 'package:our_app/util/resources/importss.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      required this.onPressed,
      required this.label,
      required this.icon});

  final void Function()? onPressed;
  final String label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 56,
      child: FloatingActionButton.extended(
        onPressed: onPressed,
        label: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        icon: icon,
      ),
    );
  }
}
