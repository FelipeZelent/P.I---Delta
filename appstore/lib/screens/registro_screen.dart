import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registros de Compras'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _carregarRegistros(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar registros'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum registro encontrado'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              dynamic registro = snapshot.data![index];
              return ListTile(
                title: Text('Compra ${index + 1}'),
                subtitle: Text('Total: \$${registro['total'].toStringAsFixed(2)}'),
                onTap: () {
                  // Exibir detalhes da compra (opcional)
                },
              );
            },
          );
        },
      ),
    );
  }

  Future<List<dynamic>> _carregarRegistros() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/carts'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List.from(data);
    } else {
      throw Exception('Falha ao carregar registros');
    }
  }
}
