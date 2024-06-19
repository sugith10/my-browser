import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebWidget extends StatelessWidget {
  const WebWidget({
    super.key,
    required this.webViewController,
  });

  final WebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: WebViewWidget(
      controller: webViewController,
    ));
  }
}