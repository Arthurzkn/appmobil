import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _resultado = '';
//calcular o melhor preço
  void _calcular(){
//pega o valor do alcool e gasolina
  double? precoAlcool = double.tryParse(_controllerAlcool.text);
  double? precoGasolina = double.tryParse(_controllerGasolina.text);

  if(precoAlcool == null || precoGasolina == null){
    setState(() {
      _resultado = 'Digite um valor válido!';
    });
    return;
     } else {
    setState(() {
      if (precoAlcool == precoGasolina) {
        _resultado = 'Um não é melhor que outro';
      } else if (precoAlcool / precoGasolina >= 0.7) {
        _resultado = 'Gasolina é melhor';
      } else {
        _resultado = 'Álcool é melhor';
      }
    });
  }
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Alcool ou Gasolina?'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.network('https://w7.pngwing.com/pngs/591/502/png-transparent-logo-generic-drug-bank-bank-globe-service-payment.png')
                ),// LOGO
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text('Calcule o melhor preço',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço do Alcool',
                  labelStyle: TextStyle(fontSize: 22)
                ),
                controller: _controllerAlcool,
              ),
              TextField(keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Preço do Gasolina',
                  labelStyle: TextStyle(fontSize: 22)
                ),
                controller: _controllerGasolina
              ),
              Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 30
                  ),
                ),
                onPressed: _calcular,
                child: Text('Calcular')
              ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}