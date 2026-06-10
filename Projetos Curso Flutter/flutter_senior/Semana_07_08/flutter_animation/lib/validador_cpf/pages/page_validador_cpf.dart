import 'package:flutter/material.dart';
import 'package:flutter_animation/validador_cpf/controller/controller_cpf.dart';

class ValidadorCpf extends StatefulWidget {
  const ValidadorCpf({super.key});

  @override
  State<ValidadorCpf> createState() => _ValidadorCpfState();
}

class _ValidadorCpfState extends State<ValidadorCpf> {
  var CPF = '';
  final controller = ControllerCpf();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Validador de CPF')),
        body: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 50),
                TextFormField(
                  onChanged: (value) {
                    CPF = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite seu CPF',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    controller.validarCpf(CPF);
                  },
                  child: Text('Calcular'),
                ),
                CPF == '' ? Text('') : controller.validarCpf(CPF),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
