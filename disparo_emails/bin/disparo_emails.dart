
void main() {
  // List<String> listaEmails = ["natalischers@gmail.com", "schersnatali@gmail.com"];
  //Set<String> listaEmails = {"natalischers@gmail.com", "schersnatali@gmail.com"};
 
  //for (var email in listaEmails) {
  //  enviarEmail(email, 'Assunto do Email');
  //}
 
 //Criando um mapa de destinatários com seus respectivos emails
  Map<String, String> listaDestinatarios = {
    'Natali': 'natalischers@gmail.com',
  };

  // Adicionando um novo destinatário ao mapa
  listaDestinatarios['Schers'] = 'schersnatali@gmail.com';

  // Verificando se um destinatário específico está na lista
  if (listaDestinatarios.containsKey('Natali')) {
    print('Email da Natali: ${listaDestinatarios['Natali']}');
  }

  // Enviando emails para todos os destinatários na lista
  listaDestinatarios.forEach((nome, email) {
    enviarEmail(email, 'Assunto do Email para $nome');
  });

  for (var nome in listaDestinatarios.keys) {
    var email = listaDestinatarios[nome];
    enviarEmail(email!, 'Assunto do Email para $nome');
  } 
}

void enviarEmail(String destinatario, String assunto) {
  print('Enviando email para $destinatario com o assunto "$assunto".');
}