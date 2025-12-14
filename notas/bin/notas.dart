import 'dart:io';

void main() {
  List<String> notas = <String>[];

  getComando();

  adicionarNota(notas);

  listarNotas(notas);
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
    print("\nNota adicionada com sucesso!");
  } else {
    print("\nNota inválida, tente novamente.");
    adicionarNota(notas);
  }

  return notas;
}

List<String> listarNotas(List<String> notas) {
  print("\nSuas notas são:");
  
  for (var nota in notas) {
    print("- $nota");
  }

  return notas;
}