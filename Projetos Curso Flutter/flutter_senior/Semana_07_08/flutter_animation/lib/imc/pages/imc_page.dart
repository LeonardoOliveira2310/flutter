import 'package:flutter/material.dart';
import 'package:flutter_animation/viewmodels/imc_viewmodels.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  var height = 0.0;
  var weight = 0.0;
  var result = '';

  //final controller = ImcController();
  //late final presenter = ImcPresenter(this);
  final viewmodel = ImcViewModel();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    viewmodel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Imc Page')),
        body: Column(
          children: [
            Column(
              children: [
                TextFormField(
                  onChanged: (value) {
                    height = double.tryParse(value) ?? 0.0;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Altura',
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    weight = double.tryParse(value) ?? 0.0;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Peso',
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    viewmodel.calcIMC(height, weight);
                  },
                  child: Text('Calcular'),
                ),
                Text(viewmodel.result),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
