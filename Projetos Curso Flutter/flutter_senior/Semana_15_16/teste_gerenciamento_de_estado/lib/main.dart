import 'package:flutter/material.dart';
import 'package:teste_gerenciamento_de_estado/estado.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Estado estado = Estado();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: estado,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: estado.temaEscuro ? ThemeData.dark() : ThemeData.light(),
        home: Scaffold(
          body: SafeArea(
            child: ListView.builder(
              itemCount: estado.checks.length,
              itemBuilder: (context, index) {
                return FutureBuilder(
                  future: estado.iniciarPreferenciasDoSistema(
                    'Texto $index',
                    index,
                  ),
                  builder: (context, asyncSnapshot) {
                    return AnimatedOpacity(
                      opacity: estado.nivelOpacidade,
                      duration: Duration(seconds: 3),
                      child: GestureDetector(
                        onTap: () {
                          ExpansionTile(title: Text('Olê olá'));
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Text('Texto $index'),
                              ),

                              // SwitchListTile(
                              //   value: estado.checks[index],
                              //   onChanged: (value) {
                              //     estado.estadoDaListaChecKBox(index, value);
                              //   },
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      estado.setContadorDeCliques(
                                        'Texto $index',
                                        index,
                                        false,
                                      );
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  Text(
                                    estado.qtdeTotalCliques[index] < 10
                                        ? 'Qtde Cliques 0${estado.qtdeTotalCliques[index]}'
                                        : 'Qtde Cliques ${estado.qtdeTotalCliques[index]}',
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      estado.setContadorDeCliques(
                                        'Texto $index',
                                        index,
                                        true,
                                      );
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  estado.setGravarUsuarioFavorito(
                                    'Texto $index',
                                    index,
                                  );
                                },
                                child: Icon(
                                  size: estado.qtdeTotalCliques[index] >= 10
                                      ? 40
                                      : 20,
                                  // key: Key(index.toString()),
                                  estado.favoritos[index]
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          floatingActionButton: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: estado.setTema,
                  child: Icon(
                    estado.temaEscuro ? Icons.dark_mode : Icons.light_mode,
                  ),
                ),
                ElevatedButton(
                  onPressed: estado.mudancaDeOpacidade,
                  child: Text('Mudança de Opacidade'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
