import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.webViewController,
    required this.context,
  });

  final WebViewController webViewController;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (value) {
        switch (value) {
          case 0:
            webViewController.goBack();
          case 1:
            webViewController.reload();
          case 2:
            webViewController.goForward();
        }
      },
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.arrowLeft,
              size: MediaQuery.of(context).size.width * 0.045,
            ),
            label: "Back"),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.rotate,
              size: MediaQuery.of(context).size.width * 0.045,
            ),
            label: "Back"),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.arrowRight,
              size: MediaQuery.of(context).size.width * 0.045,
            ),
            label: "Forward"),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedItemColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Colors.white
              : Colors.black54,
      selectedItemColor:
          MediaQuery.of(context).platformBrightness == Brightness.dark
              ? Colors.white
              : Colors.black54,
    );
  }
}
