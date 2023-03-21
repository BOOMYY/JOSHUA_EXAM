class ApiAccess {
  static const allProduct = "https://dummyjson.com/products";
  static const specificProduct = "https://dummyjson.com/products/{id}";

  static Uri getUri(String endPoint) {
    return Uri.parse(endPoint);
  }
}
