import 'package:banco/conta.dart';

void main() {
  ContaEmpresa conta1 = ContaEmpresa('Alice', 5000.0);
  ContaInvestimento conta2 = ContaInvestimento('Bob', 3000.0);
  ContaCorrente conta3 = ContaCorrente('Carlos', 1000.0);
  ContaPoupanca conta4 = ContaPoupanca('Diana', 4000.0);

  conta1.enviarPagamento(1000.0);
  conta1.receberPagamento(1500.0);

  conta2.enviarPagamento(500.0);
  conta2.receberPagamento(800.0);

  conta3.enviarPagamento(1200.0);
  conta3.receberPagamento(300.0);

  conta4.calcularRendimento();
  conta4.enviarPagamento(500.0);
}