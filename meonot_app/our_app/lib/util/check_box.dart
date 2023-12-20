import 'package:our_app/util/resources/importss.dart';

class MainCheckBox extends StatelessWidget {
  const MainCheckBox(
      {super.key,
      required this.name,
      required this.title,
      this.initalValue = false});

  final String name;
  final Widget title;
  final bool initalValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
      child: FormBuilderCheckbox(
        name: name,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0))),
        title: Transform.translate(
          offset: const Offset(15, 0),
          child: title,
        ),
        initialValue: initalValue,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
