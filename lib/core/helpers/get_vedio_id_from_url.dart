String getVideoIdFromUrl(String url) {
  final Uri uri = Uri.parse(url);
  if (uri.queryParameters.containsKey('v')) {
    return uri.queryParameters['v']!;
  }
  return '';
}