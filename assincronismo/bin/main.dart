import 'package:http/http.dart';
import 'dart:convert';

void main() {
  print("Hello, world!");

    requestDataAsync();
}

void requestDataAsync() async {
  String url = "https://gist.githubusercontent.com/natali-schers/e5f0dd30eb09d19856ea7b8a5239742f/raw/9c73ee9f30f22a47bd39201cb0e37656cd4beb9a/accounts.json";

  Response response = await get(Uri.parse(url));

  List<dynamic> accounts = json.decode(response.body);

  for (var account in accounts) {
    print("Name: ${account["name"]} - Balance: ${account["balance"]}");
  }
}