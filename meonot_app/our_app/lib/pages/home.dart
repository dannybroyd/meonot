import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Meonot",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          ),
        backgroundColor: const Color.fromARGB(255, 102, 156, 201),
        elevation: 10,
        centerTitle: true,
        leading: Container(
          margin:const EdgeInsets.all(10),
          
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
          child: 
          const Icon(
            Icons.arrow_back,
            color: Colors.blueGrey,
          ),
        ),
        actions: [
          Container(
          margin:const EdgeInsets.all(10),
          width: 30,

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
          ),
           child: 
          const Icon(
            Icons.attachment,
            color: Colors.pink,
          ),
        ),
        ],
      ),
    );
  }
}