import 'package:flutter/material.dart';
import 'package:flutter_application_27/screen/cart_screen.dart';
import 'package:flutter_application_27/screen/home_screen.dart';
import 'package:flutter_application_27/screen/search_screen.dart';

class MainScrean extends StatefulWidget {
  const MainScrean({super.key});

  @override
  State<MainScrean> createState() => _MainScreanState();
}

class _MainScreanState extends State<MainScrean> {
  int index =0;
  List<Widget> screans = [
   HomeScreen(),
   SearchScreen(),
   CartScreen(),
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("My app"),
      // ),
      body: screans[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index =value;
          setState(() { });
        },
        
         type: BottomNavigationBarType.fixed, items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Hoome"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
        BottomNavigationBarItem(icon: Icon(Icons.trolley), label: "Cart"),
      ]),
    );
  }
}