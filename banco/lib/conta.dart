class Conta {
  String titular;
  double _saldo;

  Conta(this.titular, this._saldo);

  void imprimirSaldo() {
    print('Saldo de $titular: \$$_saldo');
  }

  void receberPagamento(double valor) {
    _saldo += valor;
    imprimirSaldo();
  }

  void enviarPagamento(double valor) {
    if (_saldo >= valor) {
      _saldo -= valor;
      imprimirSaldo();
    } else {
      print(
        'Saldo insuficiente para enviar pagamento de $valor de $titular',
      );
    }
  }
}

class ContaCorrente extends Conta {
  ContaCorrente(super.titular, super.saldo);
}

class ContaPoupanca extends Conta {
  ContaPoupanca(super.titular, super.saldo);
}