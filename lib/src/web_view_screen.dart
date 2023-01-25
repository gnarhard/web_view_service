import 'package:flutter/material.dart';
import 'package:web_view_service/src/web_view.dart';

import '../web_view_service.dart';

class WebviewScreen extends StatelessWidget {
  final WebViewConfig webViewConfig;

  WebviewScreen({
    Key? key,
    required this.webViewConfig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(webViewConfig.title)),
        body: WebView(
          webViewConfig: webViewConfig,
        ));
  }
}
