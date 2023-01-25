class WebViewConfig {
  final List<String> whiteListedUrls;
  final Function getBearerTokenCallback;
  final String url;
  final String title;

  WebViewConfig({
    required this.whiteListedUrls,
    required this.getBearerTokenCallback,
    required this.url,
    required this.title,
  });
}
