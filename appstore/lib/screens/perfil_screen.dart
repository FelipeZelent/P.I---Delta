import 'package:appstore/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Perfil',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: Text('Sair'),
          ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContasScreen()),
                );
              },
              child: Text('Gerenciamento de Contas'),
            ),
          ],
        ),
      ),
    );
  }
}

class ContasScreen extends StatefulWidget {
  const ContasScreen({Key? key}) : super(key: key);

  @override
  _ContasScreenState createState() => _ContasScreenState();
}

class _ContasScreenState extends State<ContasScreen> {
  List<dynamic> usuarios = [];

  @override
  void initState() {
    super.initState();
    fetchUsuarios();
  }

  Future<void> fetchUsuarios() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        usuarios = jsonDecode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciamento de Contas',
          style: TextStyle(color: Colors.blue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: usuarios.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(usuarios[index]['username']),
            subtitle: Text(usuarios[index]['email']),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  usuarios.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Criar Usuário'),
                content: Text('Digite as informações do novo usuário.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        usuarios.add({'username': 'Novo Usuário'});
                      });
                      Navigator.of(context).pop();
                    },
                    child: Text('Criar'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}