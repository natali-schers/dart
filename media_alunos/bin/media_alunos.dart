import 'dart:io';

void main() {
  List<String> estudantes = <String>[];
  List<List<double>> notas = <List<double>>[];

  menu(estudantes, notas);
}

List<String> adicionarEstudante(List<String> estudantes, List<List<double>> notas) {
  print("\nDigite o nome do estudante que deseja adicionar:");

  String? estudante = stdin.readLineSync();

  if (estudante != null && estudante.isNotEmpty) {
    estudantes.add(estudante);

    print("\nDigite as notas de $estudante e registre-as com a tecla 'enter' (ou digite 'fim' para encerrar):");

    String? notaEstudante;

    while (notaEstudante != "fim") {
      notaEstudante = stdin.readLineSync();

      if (notaEstudante != null && notaEstudante.isNotEmpty && notaEstudante != "fim") {

        double? notaConvertida = double.tryParse(notaEstudante);

        if (notaConvertida != null) {
          if (notas.length < estudantes.length) {
            notas.add(<double>[]);
          }

          notas[estudantes.indexOf(estudante)].add(notaConvertida);

          print("Nota adicionada: $notaConvertida");
        } 
        else {
          print("Nota inválida, tente novamente.");
        }
      }
    }

    if(notas.length < estudantes.length) {
      notas.add(<double>[]);
    }

    print("\nMédia do estudante registrada com sucesso!");
  } else {
    print("\nNome inválido, tente novamente.");
    adicionarEstudante(estudantes, notas);
  }

  return estudantes;
}

void listarEstudantes(List<String> estudantes, List<List<double>> notas) {
  if (estudantes.isEmpty) {
    print("\nNenhum estudante cadastrado.");
  } else {
    print("\nEstudantes cadastrados:");

    for (var i = 0; i < estudantes.length; i++) {
      String estudante = estudantes[i];
      List<double> notasEstudante = notas[i];

      double media = notasEstudante.isNotEmpty ? notasEstudante.reduce((a, b) => a + b) / notasEstudante.length : 0.0;

      print("- $estudante: Média = ${media.toStringAsFixed(2)}");
    }
  }
}

void menu(List<String> estudantes, List<List<double>> notas) {
  print(
    "\nDigite o comando: \n1 - Adicionar estudante \n2 - Listar estudantes \n3 - Sair",
  );

  String? comando = stdin.readLineSync();

  switch (comando) {
    case "1":
      adicionarEstudante(estudantes, notas);
      menu(estudantes, notas);
      break;
    case "2":
      listarEstudantes(estudantes, notas);
      menu(estudantes, notas);
      break;
    case "3":
      print("\nSaindo...");
      break;
    default:
      print("\nComando inválido, tente novamente.\n");
      menu(estudantes, notas);
  }
}
