import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Estado extends ChangeNotifier {
  bool _estadoCheckBox = false;
  bool get estadoCheckBox => _estadoCheckBox;

  bool _favorito = false;
  bool get favorito => _favorito;

  bool _temaEscuro = false;
  bool get temaEscuro => _temaEscuro;

  double _nivelOpacidade = 1.0;
  double get nivelOpacidade => _nivelOpacidade;

  int _qtdeDeCliques = 0;
  int get qtdeDeCliques => _qtdeDeCliques;

  final List<bool> _checks = List.generate(5, (_) => false);
  List<bool> get checks => _checks;

  final List<bool> _favoritos = List.generate(5, (_) => false);
  List<bool> get favoritos => _favoritos;

  final List<int> _qtdeTotalCliques = List.generate(5, (_) => 0);
  List<int> get qtdeTotalCliques => _qtdeTotalCliques;

  void mudarEstadoDaChecKBox(bool estado) {
    _estadoCheckBox = estado;
    notifyListeners();
  }

  void estadoDaListaChecKBox(int index, bool estado) {
    _checks[index] = estado;
    notifyListeners();
  }

  void mudancaDeOpacidade() {
    _nivelOpacidade = _nivelOpacidade == 0 ? 1.0 : 0.0;
    notifyListeners();
  }

  Future<void> setContadorDeCliques(
    String chave,
    int index,
    bool addValor,
  ) async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _qtdeDeCliques = preferencias.getInt('$chave qtdeDeVezesAssistido') ?? 0;

    addValor ? _qtdeDeCliques++ : _qtdeDeCliques--;

    if (_qtdeDeCliques <= 0) _qtdeDeCliques = 0;

    preferencias.setInt('$chave qtdeDeVezesAssistido', _qtdeDeCliques);

    _qtdeTotalCliques[index] = _qtdeDeCliques;

    notifyListeners();
    debugPrint(
      'Total de Cliques em $chave: ${preferencias.getInt('$chave qtdeDeVezesAssistido').toString()}',
    );
  }

  Future<void> setGravarUsuarioFavorito(String chave, int index) async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _favorito = preferencias.getBool('$chave favorito') ?? false;

    _favorito = !_favorito;

    preferencias.setBool('$chave favorito', _favorito);
    _favoritos[index] = _favorito;

    notifyListeners();
    _favorito
        ? debugPrint(
            'Este é um Favorito $chave: ${preferencias.getBool('$chave favorito').toString()}',
          )
        : debugPrint(
            'Este NÃO É MAIS UM Favorito $chave: ${preferencias.getBool('$chave favorito').toString()}',
          );
  }

  Future<void> getBuscarUsuarioFavorito(String chave, int index) async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _favoritos[index] = preferencias.getBool('$chave favorito') ?? false;

    notifyListeners();
    //return _favoritos[index];
  }

  Future<void> getBuscarTotalDeCliques(String chave, int index) async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _qtdeTotalCliques[index] =
        preferencias.getInt('$chave qtdeDeVezesAssistido') ?? 0;

    notifyListeners();
    //return _favoritos[index];
  }

  Future<void> setTema() async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _temaEscuro = !temaEscuro;
    preferencias.setBool('temaEscuro', _temaEscuro);
    notifyListeners();
  }

  Future<void> getTema() async {
    SharedPreferences preferencias = await SharedPreferences.getInstance();
    _temaEscuro = preferencias.getBool('temaEscuro') ?? false;
    notifyListeners();
  }

  Future<void> iniciarPreferenciasDoSistema(String chave, int index) async {
    getTema();
    getBuscarTotalDeCliques(chave, index);
    getBuscarUsuarioFavorito(chave, index);
  }
}
