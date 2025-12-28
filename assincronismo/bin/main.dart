import 'package:http/http.dart';

void main() {
  print("Hello, world!");

  requestData();
}

void requestData() {
  String url = "https://gist.githubusercontent.com/natali-schers/e5f0dd30eb09d19856ea7b8a5239742f/raw/9c73ee9f30f22a47bd39201cb0e37656cd4beb9a/accounts.json";

  Future<Response> futureResponse = get(Uri.parse(url));

  futureResponse.then((Response response) {
    print(response.body);
  },);
}