import 'dart:io';

void main() {
  List<String> notas = <String>[];

  menu(notas);
}

String getComando() {
  print("Digite o comando: \n1 - Adicionar nota \n2 - Listar notas \n3 - Sair");

  List<String> comandos = <String>["1", "2", "3"];

  String? entrada = "";

  entrada = stdin.readLineSync();

  if (entrada == null || !comandos.contains(entrada)) {
    print("\nComando inválido, tente novamente.\n");
    getComando();
  }

  return entrada!;
}

List<String> adicionarNota(List<String> notas) {
  print("\nDigite a nota que deseja adicionar:");

  String? nota = stdin.readLineSync();

  if (nota != null && nota.isNotEmpty) {
    notas.add(nota);
    print("\nNota adicionada com sucesso!\n");
  } else {
    print("\nNota inválida, tente novamente.\n");
    adicionarNota(notas);
  }

  return notas;
}

List<String> listarNotas(List<String> notas) {
  if (notas.isEmpty) {
    print("\nNenhuma nota cadastrada.\n");
    return notas;
  } else {
    print("\nNotas cadastradas:");

    for (var nota in notas) {
      print("- $nota");
    }

    print("");
  }

  return notas;
}

void menu(List<String> notas) {
  String comando = getComando();

  switch (comando) {
    case "1":
      adicionarNota(notas);
      menu(notas);
      break;
    case "2":
      listarNotas(notas);
      menu(notas);
      break;
    case "3":
      print("\nSaindo...");
      exit(0);
    default:
      print("\nComando inválido, tente novamente.\n");
      menu(notas);
  }
}
