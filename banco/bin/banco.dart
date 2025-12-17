void main() {
  List<String> contas = <String>[];
  List<double> saldos = <double>[];

  Conta conta1 = Conta('Alice', 1500.0);
  Conta conta2 = Conta('Bob', 2500.5);
}

class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);
}