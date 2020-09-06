class HttpData {
  final Map queryParams;
  final Map jsonParams;
  final Map dynamicParams;

  const HttpData({this.queryParams, this.jsonParams, this.dynamicParams});

  factory HttpData.fromList(List<Map> items) => items.length != 3
      ? throw ArgumentError('items must have length 3')
      : HttpData(
          queryParams: items[0], jsonParams: items[1], dynamicParams: items[2]);

  @override
  String toString() => '[$queryParams, $jsonParams, $dynamicParams]';
}
