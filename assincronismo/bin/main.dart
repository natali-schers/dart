import 'dart:async';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:assincronismo/api_key.dart';

StreamController<String> streamController = StreamController<String>();

void main() {
  StreamSubscription subscription = streamController.stream.listen((String info) {
    print(info);
  });

  requestDataAsync();

  sendDataAsync({
    "id": "ID011",
    "name": "Natali",
    "lastName": "Schers",
    "balance": 2500.0,
  });
}

Future<List<dynamic>> requestDataAsync() async {
  String url = "https://gist.githubusercontent.com/natali-schers/e5f0dd30eb09d19856ea7b8a5239742f/raw/9c73ee9f30f22a47bd39201cb0e37656cd4beb9a/accounts.json";

  Response response = await get(Uri.parse(url));

  List<dynamic> accounts = json.decode(response.body);

  streamController.add(
    "${DateTime.now()} | Requisição assíncrona concluída com sucesso!",
  );

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
        "accounts.json": {"content": encondedData},
      },
    }),
  );

  switch (response.statusCode.toString()[0]) {
    case '2':
      streamController.add("${DateTime.now()} | Dados enviados com sucesso!");
      break;
    case '3':
      streamController.add(
        "${DateTime.now()} | Redirecionamento ao enviar dados: ${response.statusCode} - ${response.body}",
      );
      break;
    case '4':
      streamController.add(
        "${DateTime.now()} | Erro do cliente ao enviar dados: ${response.statusCode} - ${response.body}",
      );
      break;
    case '5':
      streamController.add(
        "${DateTime.now()} | Erro do servidor ao enviar dados: ${response.statusCode} - ${response.body}",
      );
      break;
    default:
      streamController.add(
        "${DateTime.now()} | Erro ao enviar dados: ${response.statusCode} - ${response.body}",
      );
  }
}
