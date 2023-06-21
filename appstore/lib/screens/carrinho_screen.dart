import 'package:flutter/material.dart';

class CarrinhoScreen extends StatefulWidget {
  const CarrinhoScreen({super.key});

  @override
  State<CarrinhoScreen> createState() => _CarrinhoScreenState();
}

class _CarrinhoScreenState extends State<CarrinhoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Carrinho',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}