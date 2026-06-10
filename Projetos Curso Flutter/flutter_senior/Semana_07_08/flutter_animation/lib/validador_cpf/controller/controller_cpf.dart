import 'package:flutter/material.dart';
import 'package:flutter_animation/validador_cpf/model/model_cpf.dart';

class ControllerCpf {
  Widget validarCpf(String cpf) {
    final cPF = ModelCpf(cpf: cpf);
    return Text('${cPF.verificarCpf(cpf)}');
  }
}
