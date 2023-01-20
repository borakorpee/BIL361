class ApiPathBuilder {
  final String _baseUrl;
  final Map<String, String> _pathParams = {};
  final Map<String, String> _queryParams = {};

  ApiPathBuilder(this._baseUrl);

  ApiPathBuilder addPathParam(String key, String value) {
    _pathParams[key] = value;
    return this;
  }

  ApiPathBuilder addQueryParam(String key, String value) {
    _queryParams[key] = value;
    return this;
  }

  Uri build() {
    var path = _baseUrl;
    _pathParams.forEach((key, value) {
      path = path.replaceAll(':$key', value);
    });
    var uri = Uri.parse(path);
    var queryParams = uri.queryParameters;
    _queryParams.forEach((key, value) {
      queryParams[key] = value;
    });
    return uri.replace(queryParameters: queryParams);
  }
}
