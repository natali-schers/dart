abstract class Conta {
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
        'Saldo insuficiente para enviar pagamento de $valor de $titular!',
      );
    }
  }
}

class ContaCorrente extends Conta {
  double emprestimoDisponivel = 300.0;

  ContaCorrente(super.titular, super.saldo);

  @override
  void enviarPagamento(double valor) {
    if (_saldo + emprestimoDisponivel >= valor) {
      _saldo -= valor;
      imprimirSaldo();
    } else {
      print('Saldo insuficiente para enviar pagamento de $valor de $titular!');
    }
  }
}

class ContaPoupanca extends Conta {
  double rendimento = 0.05;

  ContaPoupanca(super.titular, super.saldo);

  void calcularRendimento() {
    _saldo += _saldo * rendimento;
    imprimirSaldo();
  }
}

mixin Imposto {
  double taxa = 0.03;

  double calcularImposto(double valor) {
    return valor * taxa;
  }
}

class ContaEmpresa extends Conta with Imposto {
  ContaEmpresa(super.titular, super._saldo);

  @override
  void enviarPagamento(double valor) {
    double valorComImposto = valor + calcularImposto(valor);
    if (_saldo >= valorComImposto) {
      _saldo -= valorComImposto;
      imprimirSaldo();
    } else {
      print(
        'Saldo insuficiente para enviar pagamento de $valor (com imposto) de $titular!',
      );
    }
  }

  @override
  void receberPagamento(double valor) {
    double valorComImposto = valor - calcularImposto(valor);
    _saldo += valorComImposto;
    imprimirSaldo();
  }
}

class ContaInvestimento extends Conta with Imposto {
  ContaInvestimento(super.titular, super._saldo);

  @override
  void enviarPagamento(double valor) {
    double valorComImposto = valor + calcularImposto(valor);
    if (_saldo >= valorComImposto) {
      _saldo -= valorComImposto;
      imprimirSaldo();
    } else {
      print(
        'Saldo insuficiente para enviar pagamento de $valor (com imposto) de $titular!',
      );
    }
  }

  @override
  void receberPagamento(double valor) {
    double valorComImposto = valor - calcularImposto(valor);
    _saldo += valorComImposto;
    imprimirSaldo();
  }
}