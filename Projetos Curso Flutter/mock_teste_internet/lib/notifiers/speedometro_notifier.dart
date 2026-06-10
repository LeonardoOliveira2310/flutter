import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dart_ping/dart_ping.dart';

class SpeedometroNotifier extends ChangeNotifier {
  double _ping = 0.0;
  double get ping => _ping;

  double _velocidadeDownload = 0.0;
  double get velocidadeDownload => _velocidadeDownload;

  bool _testInProgress = false;
  bool get testeInProgress => _testInProgress;

  bool _testandoPing = false;
  bool get testandoPing => _testandoPing;

  double _downloadRate = 0;
  double get downloadRate => _downloadRate;

  String _downloadProgress = '0';
  String get downloadProgress => _downloadProgress;

  double _progressoDownload = 0.0;
  double get progressoDownload => _progressoDownload;

  int _downloadCompletionTime = 0;
  int get downloadCompletionTime => _downloadCompletionTime;

  String _unitText = 'Mbps';
  String get unitText => _unitText;

  void atualizarPing(double ping) {
    _ping = ping;
    notifyListeners();
  }

  void atualizarVelocidadeDeDownload(double velocidadeDownload) {
    _velocidadeDownload = velocidadeDownload;
    notifyListeners();
  }

  bool testeEmProgresso(bool testeEmProgresso) {
    _testInProgress = testeEmProgresso;

    notifyListeners();
    return _testInProgress;
  }

  void calculandoPing(bool calculandoPing) {
    _testandoPing = calculandoPing;
    notifyListeners();
  }

  void taxaDeDownload(double taxaDeDownload) {
    _downloadRate = taxaDeDownload;
    notifyListeners();
  }

  void progressoDeDownload(String progressoDeDownload) {
    _downloadProgress = progressoDeDownload;
    _progressoDownload = double.parse(_downloadProgress);
    notifyListeners();
  }

  void tempoDeDownload(int tempoDeDownload) {
    _downloadCompletionTime = tempoDeDownload;
    notifyListeners();
  }

  void textoUnidadeMedidaVelocidade(String textoUnidadeMedidaVelocidade) {
    _unitText = textoUnidadeMedidaVelocidade;
    notifyListeners();
  }

  Future<double> checkLatency({required Host host}) async {
    final ping = Ping(host.url, count: 5);
    double totalTime = 0;
    int successfulPings = 0;

    await for (final PingData pingData in ping.stream) {
      if (pingData.response != null && pingData.response!.time != null) {
        totalTime += pingData.response!.time!.inMilliseconds;
        successfulPings++;
        atualizarPing(totalTime);
      }
    }
    return successfulPings > 0 ? totalTime / successfulPings : -1.0;
  }

  void reset() {
    _testInProgress = false;
    _downloadRate = 0;
    _downloadProgress = '0';
    _unitText = 'Mbps';
    _downloadCompletionTime = 0;
    _progressoDownload = 0.0;
    notifyListeners();
  }
}

enum Host { google, aws }

extension on Host {
  String get url {
    switch (this) {
      case Host.google:
        return 'google.com';
      case Host.aws:
        return 'ec2.sa-east-1.amazonaws.com';
    }
  }
}
