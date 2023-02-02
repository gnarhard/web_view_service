class WebViewService {
  List<String> whiteListedUrls = [
    'https://facebook.com',
    'https://www.instagram.com',
    'https://twitter.com',
    'https://youtube.com',
    'https://linkedin.com',
    'https://tiktok.com',
    'https://youtu.be',
    'https://www.youtube.com',
    'https://youtube.com',
    'https://vimeo.com',
    'https://player.vimeo.com',
  ];

  WebViewService({List<String> whiteListedUrls = const []}) {
    this.whiteListedUrls.addAll(whiteListedUrls);
  }
}
