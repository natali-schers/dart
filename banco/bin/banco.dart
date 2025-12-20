import 'package:banco/conta.dart';

void main() {
  List<Conta> contas = <Conta>[];

  Conta conta1 = Conta('Alice', 1500.0);
  Conta conta2 = Conta('Bob', 2500.5);
  ContaCorrente conta3 = ContaCorrente('Carlos', 1000.0);
  ContaPoupanca conta4 = ContaPoupanca('Diana', 4000.0);

  conta3.enviarPagamento(1400.0);

  conta4.calcularRendimento();
}