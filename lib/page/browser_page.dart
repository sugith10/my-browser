import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widget/bottom_bar.dart';
import '../widget/loading_widget.dart';
import '../widget/top_widget.dart';
import '../widget/webwidget.dart';

class BrowserPage extends StatefulWidget {
  const BrowserPage({super.key});

  @override
  State<BrowserPage> createState() => _BrowserPageState();
}

class _BrowserPageState extends State<BrowserPage> {
  late TextEditingController textEditingController;
  String searchEngineUrl = "https://www.google.com/";
  bool isLoading = false;
  late WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(text: searchEngineUrl);
    webViewController = WebViewController();
    webViewController.setJavaScriptMode(JavaScriptMode.unrestricted);
    webViewController.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        textEditingController.text = url;
        setState(() {
          isLoading = true;
        });
      },
      onPageFinished: (url) {
        setState(() {
          isLoading = false;
        });
      },
    ));
    loadUrl(textEditingController.text);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ignore: deprecated_member_use
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          body: Column(
            children: [
              TopWidget(
                textEditingController: textEditingController,
                loadHome: () => loadUrl(searchEngineUrl),
                onSubmitted: () => loadUrl(textEditingController.text),
              ),
             LoadingWidget(isLoading: isLoading),
              WebWidget(webViewController: webViewController),
              BottomBar(webViewController: webViewController, context: context),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (await webViewController.canGoBack()) {
      webViewController.goBack();
      return Future.value(false);
    }
    return Future.value(true);
  }

  loadUrl(String value) {
    Uri uri = Uri.parse(value);
    if (!uri.isAbsolute) {
      uri = Uri.parse("${searchEngineUrl}search?q=$value");
    }
    webViewController.loadRequest(uri);
  }


  
 
}


