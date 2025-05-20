import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _preco1Controller = TextEditingController();
  final TextEditingController _quantidade1Controller = TextEditingController();
  final TextEditingController _preco2Controller = TextEditingController();
  final TextEditingController _quantidade2Controller = TextEditingController();

  String _resultado = '';

  void _calcularMelhorProduto() {
    double? preco1 = double.tryParse(_preco1Controller.text);
    double? quantidade1 = double.tryParse(_quantidade1Controller.text);
    double? preco2 = double.tryParse(_preco2Controller.text);
    double? quantidade2 = double.tryParse(_quantidade2Controller.text);

    if (preco1 == null || quantidade1 == null || preco2 == null || quantidade2 == null || 
        preco1 <= 0 || quantidade1 <= 0 || preco2 <= 0 || quantidade2 <= 0) {
      setState(() {
        _resultado = 'Coloca certinho ai';
      });
      return;
    }

    double custo1 = preco1 / quantidade1;
    double custo2 = preco2 / quantidade2;

    setState(() {
      if (custo1 == custo2) {
        _resultado = 'Ambos os produtos têm o mesmo custo por unidade.';
      } else if (custo1 < custo2) {
        _resultado = 'Produto 1 é mais vantajoso (R\$ ${custo1.toStringAsFixed(2)} por unidade).';
      } else {
        _resultado = 'Produto 2 é mais vantajoso (R\$ ${custo2.toStringAsFixed(2)} por unidade).';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Produtos'),
        backgroundColor: Colors.yellow,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network("https://www.istoedinheiro.com.br/wp-content/uploads/sites/17/istoeimagens/imagens/mi_873047740829475.jpg"),
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: 
              Text(
                'Insira as informações:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Text('Produto 1', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
              controller: _preco1Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade (Kg, L, etc)'),
              controller: _quantidade1Controller,
            ),
            const SizedBox(height: 20),
            const Text('Produto 2', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
              controller: _preco2Controller,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Quantidade (Kg, L, etc)'),
              controller: _quantidade2Controller,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              onPressed: _calcularMelhorProduto,
              child: const Text('Comparar'),
            ),
            const SizedBox(height: 20),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
