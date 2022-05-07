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

  void buscaCEP() {}

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
                  onPressed: () => {},
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
