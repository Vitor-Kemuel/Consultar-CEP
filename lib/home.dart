import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String resultado = "";
  TextEditingController txtCEP = TextEditingController();

  Future<void> buscarCEP() async {
    String cep = txtCEP.text;
    var url = Uri.https('viacep.com.br', '/ws/$cep/json/', {'q': '{http}'});
    http.Response response;

    response = await http.get(url);

    print('Resposta:' + response.body);

    print('Resposta Servidor:' + response.statusCode.toString());
    Map<String, dynamic> dados = json.decode(response.body);

    String logradouro = dados["logradouro"];
    String complemento = dados["complemento"];
    String bairro = dados["bairro"];
    String localidade = dados["localidade"];

    String respostaCEP =
        "Endereço\n$logradouro\nComplemento: $complemento\nBairro: $bairro, $localidade";

    setState(() {
      resultado = respostaCEP;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consumo de API'),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: txtCEP,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite um CEP",
                ),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                ),
              ),
              Container(
                color: Colors.amber,
                margin: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: buscarCEP,
                  child: Text("Pesquisar"),
                ),
              ),
              Text(resultado)
            ],
          ),
        ),
      ),
    );
  }
}
