import 'package:flutter/material.dart';
import 'package:our_app/main.dart';
import 'package:url_launcher/url_launcher.dart';


class MainButton extends StatelessWidget {
  final String task;
  final String routeName;
  final bool link;
  const MainButton({super.key, required this.task, required this.routeName, this.link = false});
  //launch url for dorm site
  _launchURLBrowser() async {
  if (await canLaunchUrl(Uri.parse(routeName))) {
    await launchUrl(Uri.parse(routeName));
  } else {
      throw 'Could not launch $routeName';
    }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
      child: GestureDetector(
        onTap: (){
          if(link){
            // if the button is a link
            _launchURLBrowser();
          }
          else{
          Navigator.pushNamed(context, routeName);
          }
         },
        child: Container(
          decoration: BoxDecoration(
            color: MyApp.mainColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Center(
              child: Text(task,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
