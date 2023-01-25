class WebViewConfig {
  final List<String> whiteListedUrls;
  final String? bearerToken;
  final String url;
  final String title;

  WebViewConfig({
    required this.whiteListedUrls,
    this.bearerToken,
    required this.url,
    required this.title,
  });
}
