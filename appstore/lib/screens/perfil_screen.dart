import 'package:flutter/material.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Perfil',
            style: TextStyle(fontSize: 50),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para abrir a tela de histórico de compras
            },
            child: Text('Histórico de Compras'),
          ),
        ],
      ),
    );
  }
}
