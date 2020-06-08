/// 文件提供器
class HLFileProvider {
  var pathMap = new Map<String, String>();
  int encodeKey;

  HLFileProvider(this.encodeKey, this.pathMap);

  /// 是否需要获取真实路径
  bool isRequireRealPath(String path) {
    return pathMap.containsKey(path);
  }

  /// 获取真实的路径
  List<String> getUriRealPath(Uri uri) {
    if (isRequireRealPath(uri.path)) {
      return pathMap[uri.path].split("/");
    }
    return uri.pathSegments;
  }

  /// 解密数据，如果需要则进行解密操作
  List<int> decodeData(List<int> data, String path) {
    if (encodeKey == null) {
      return data;
    }
    for (var i = 0; i < data.length; i++) {
      data[i] = data[i] ^ encodeKey;
    }
    return data;
  }
}
