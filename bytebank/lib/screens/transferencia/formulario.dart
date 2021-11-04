import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando transferência';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';
const _rotuloValor = 'Valor da transferência';
const _dicaValor = '00.00';
const _botaoConfirmar = 'Confirmar';

class FormularioTransferencias extends StatefulWidget {
  FormularioTransferencias({Key? key}) : super(key: key);

  @override
  State<FormularioTransferencias> createState() =>
      _FormularioTransferenciasState();
}

class _FormularioTransferenciasState extends State<FormularioTransferencias> {
  final TextEditingController _controladorNumeroConta = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controlador: _controladorValor,
              icone: Icons.monetization_on,
              rotulo: _rotuloValor,
              dica: _dicaValor,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_botaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorNumeroConta.text);
    final double? valor = double.tryParse(_controladorValor.text);
    if (numeroConta != null && valor != null) {
      final novaTransferencia = Transferencia(valor, numeroConta);
      Navigator.pop(context, novaTransferencia);
    }
  }
}
