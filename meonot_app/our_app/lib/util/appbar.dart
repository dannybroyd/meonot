import 'package:our_app/util/resources/importss.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String text;
  final bool middle;
  final bool isProfile;
  final bool isBackButton;
  const MyAppBar(
      {super.key,
      this.text = "",
      this.middle = false,
      this.isProfile = false,
      this.isBackButton = true});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(80);
}

class _MyAppBarState extends State<MyAppBar> {
  String _checktime() {
    String temp = "";
    setState(() {
      //check time for greeting
      DateTime now = DateTime.now();
      int hours = now.hour;
      if (hours >= 1 && hours <= 12) {
        temp = "בוקר טוב";
      } else if (hours >= 12 && hours < 16) {
        temp = "צהריים טובים";
      } else if (hours >= 16 && hours < 18) {
        temp = "אחר הצהריים טובים";
      } else if (hours >= 18 && hours < 22) {
        temp = "ערב טוב";
      } else {
        temp = "לילה טוב";
      }
    });
    if (widget.text == "") {
      String profileName = _getFirstName();
      return "$temp, $profileName";
    }
    return widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: widget.isBackButton,
        elevation: 4,
        centerTitle: widget.middle,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: FittedBox(
            child: Text(
              _checktime(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (!widget.isProfile) {
                  Navigator.pushNamed(context, '/profilepage');
                }
              },
              icon: const Icon(Icons.account_circle),
              iconSize: 36)
        ]);
  }
}

String _getFirstName() {
  return myProfile.name.split(" ")[0];
}
