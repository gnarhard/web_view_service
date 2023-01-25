import 'package:flutter/material.dart';
import 'package:web_view_service/src/web_view_config.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  final WebViewConfig webViewConfig;
  const WebView({Key? key, required this.webViewConfig}) : super(key: key);

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late final WebViewController webviewController;
  bool _isReady = false;

  @override
  void initState() {
    super.initState();

    webviewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              _isReady = true;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            for (String whiteListedUrl
                in widget.webViewConfig.whiteListedUrls) {
              if (request.url.startsWith(whiteListedUrl)) {
                return NavigationDecision.navigate;
              }
            }
            return NavigationDecision.prevent;
          },
        ),
      );

    if (widget.webViewConfig.bearerToken == null) {
      webviewController.loadRequest(Uri.parse(widget.webViewConfig.url));
    } else {
      webviewController.loadRequest(Uri.parse(widget.webViewConfig.url),
          headers: {
            'Authorization': 'Bearer ${widget.webViewConfig.bearerToken}'
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isReady
        ? WebViewWidget(controller: webviewController)
        : const Center(child: CircularProgressIndicator());
  }
}
