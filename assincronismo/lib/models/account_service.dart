import 'dart:async';
import 'dart:convert';
import 'package:assincronismo/api_key.dart';
import 'package:assincronismo/models/account.dart';
import 'package:http/http.dart';

class AccountService {
  final StreamController<String>_streamController = StreamController<String>();
  Stream<String> get infoStream => _streamController.stream;
  String url = "https://api.github.com/gists/e5f0dd30eb09d19856ea7b8a5239742f";

  Future<List<Account>> getAll() async {
    Response response = await get(Uri.parse(url));

    _streamController.add(
      "${DateTime.now()} | Requisição assíncrona concluída com sucesso!",
    );

    Map<String, dynamic> mapResponse = jsonDecode(response.body);
    
    List<dynamic> listDynamic = jsonDecode(mapResponse["files"]["accounts.json"]["content"]);

    return listDynamic.map((dynamic item) => Account.fromMap(item)).toList();
  }

  Future<void> addAccount(Account account) async {
    List<Account> accounts = await getAll();
    
    accounts.add(account);

    List<Map<String, dynamic>> listMap = accounts.map((Account acc) => acc.toMap()).toList();
    
    String encondedData = json.encode(listMap);

    Response response = await patch(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $githubApiKey",
        "Content-Type": "application/json",
      },
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
        _streamController.add("${DateTime.now()} | Dados enviados com sucesso!");
        break;
      case '3':
        _streamController.add(
          "${DateTime.now()} | Redirecionamento ao enviar dados: ${response.statusCode} - ${response.body}",
        );
        break;
      case '4':
        _streamController.add(
          "${DateTime.now()} | Erro do cliente ao enviar dados: ${response.statusCode} - ${response.body}",
        );
        break;
      case '5':
        _streamController.add(
          "${DateTime.now()} | Erro do servidor ao enviar dados: ${response.statusCode} - ${response.body}",
        );
        break;
      default:
        _streamController.add(
          "${DateTime.now()} | Erro ao enviar dados: ${response.statusCode} - ${response.body}",
        );
    }
  }
}
