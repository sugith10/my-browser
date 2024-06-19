import 'package:flutter/material.dart';
import 'package:my_browser/page/browser_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.white)),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      themeMode: ThemeMode.system,
      title: "My Browser",
      home: const BrowserPage(),
    );
  }
}
