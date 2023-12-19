import 'package:our_app/util/resources/importss.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:google_fonts/google_fonts.dart';

class MainButton extends StatelessWidget {
  final String task;
  final String routeName;
  final bool link;
  final bool isOvernight;
  const MainButton(
      {super.key,
      required this.task,
      required this.routeName,
      this.link = false,
      this.isOvernight = true});
  //launch url for dorm site
  _launchURLBrowser() async {
     launchUrlString(routeName, 
     mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
      child: GestureDetector(
        onTap: () {
          if (link) {
            // if the button is a link
            _launchURLBrowser();
          } else if (isOvernight) {
            Navigator.pushNamed(context, routeName);
          } else {
            // if pressed on mevakrim
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const FavoritesPage(
                          isOvernight: false,
                        )));
          }
        },
        child: Container(
          height: 98,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Text(
                task,
                style:
                GoogleFonts.varelaRound(textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32,) ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
