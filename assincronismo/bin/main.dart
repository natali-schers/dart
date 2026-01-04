import 'package:http/http.dart';
import 'dart:convert';
import 'package:assincronismo/api_key.dart';

void main() {
  print("Hello, world!");

  //requestDataAsync();

  sendDataAsync({
    "id": "ID011",
    "name": "Natali",
    "lastName": "Schers",
    "balance": 2500.0,
  });
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/natali-schers/e5f0dd30eb09d19856ea7b8a5239742f/raw/9c73ee9f30f22a47bd39201cb0e37656cd4beb9a/accounts.json";

  Response response = await get(Uri.parse(url));

  List<dynamic> accounts = json.decode(response.body);

  return accounts;
}

void sendDataAsync(Map<String, dynamic> data) async {
  List<dynamic> accounts = await requestDataAsync();

  accounts.add(data);

  String encondedData = json.encode(accounts);

  String url = "https://api.github.com/gists/e5f0dd30eb09d19856ea7b8a5239742f";

  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "Updated accounts data",
      "public": true,
      "files": {
        "accounts.json": {"content": encondedData}
      }
    }),
  );

  print(response.body);
  print(response.statusCode);
}
