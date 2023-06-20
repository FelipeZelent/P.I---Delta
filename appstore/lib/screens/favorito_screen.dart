import 'package:flutter/material.dart';

class FavoritoScreen extends StatefulWidget {
  const FavoritoScreen({super.key});

  @override
  State<FavoritoScreen> createState() => _FavoritoScreenState();
}

class _FavoritoScreenState extends State<FavoritoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Favoritos',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}