import 'package:banco/conta.dart';

void main() {
  List<Conta> contas = <Conta>[];

  Conta conta1 = Conta('Alice', 1500.0);
  Conta conta2 = Conta('Bob', 2500.5);
  ContaCorrente conta3 = ContaCorrente('Carlos', 3000.0);
  ContaPoupanca conta4 = ContaPoupanca('Diana', 4000.0);

  contas.add(conta1);
  contas.add(conta2);

  for (var conta in contas) {
    conta.imprimirSaldo();
  }

  conta1.receberPagamento(500.0);
  conta2.enviarPagamento(300.0);
  conta3.enviarPagamento(3000.0);
  conta4.receberPagamento(750.0);
}