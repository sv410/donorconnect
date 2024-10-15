
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Light/Dark Mode Toggle"),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: isDarkMode ? Colors.black : Colors.yellow,
              ),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    left: isDarkMode ? 50.0 : 0.0,
                    right: isDarkMode ? 0.0 : 50.0,
                    child: CircleAvatar(
                      backgroundColor: isDarkMode ? Colors.grey[800] : Colors.white,
                      child: Icon(isDarkMode ? Icons.nights_stay : Icons.wb_sunny, color: isDarkMode ? Colors.white : Colors.orange),
                      radius: 25.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
