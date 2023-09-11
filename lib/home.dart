import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAltura = TextEditingController();
  TextEditingController _controllerLargura = TextEditingController();
  String _textoResultado = "";

  void _Calcular() {
    double? tamanhoAltura = double.tryParse(_controllerAltura.text);
    double? tamanhoLargura = double.tryParse(_controllerLargura.text);

    if (tamanhoAltura == null || tamanhoLargura == null) {
      setState(() {
        _textoResultado =
            'Número inválido, digite números maiores que 0 e utilizando (.)';
      });
    } else {
      double area = tamanhoAltura * tamanhoLargura;
      setState(() {
        _textoResultado = 'A área do retângulo é $area';
      });
    }
  }

  void _limpaCampos() {
    _controllerLargura.clear();
    _controllerAltura.clear();
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo da Área do Retângulo"),
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Calcule a área de um retângulo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.red,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
                Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    image: AssetImage("imagens/area.png"),
                    width: 200,
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Largura"),
                style: TextStyle(fontSize: 25),
                controller: _controllerLargura,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: "Altura"),
                style: TextStyle(fontSize: 25),
                controller: _controllerAltura,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(fontSize: 25),
                  ),
                  onPressed: _Calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

 


