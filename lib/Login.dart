import 'package:flutter/material.dart';
import 'package:my_project/ListaTarefas.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 236, 173, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 197, 68, 217),
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.person,
                size: 48.0, // Tamanho do ícone
                color: Color.fromARGB(255, 64, 5, 71), // Cor do ícone
              ),
            ),
            // Campo de entrada para login
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10), // Espaçamento vertical entre os campos
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), // Borda arredondada
                border: Border.all(
                  color: Color.fromARGB(255, 196, 80, 191), // Cor da borda
                  width: 3.0, // Largura da borda
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Login',
                  contentPadding:
                      EdgeInsets.all(16.0), // Espaçamento interno do TextField
                  border:
                      InputBorder.none, // Remove a borda padrão do TextField
                ),
              ),
            ),

            // Campo de entrada para senha
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: 10), // Espaçamento vertical entre os campos
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0), // Borda arredondada
                border: Border.all(
                  color: Color.fromARGB(255, 176, 52, 164), // Cor da borda
                  width: 3.0, // Largura da borda
                ),
              ),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Senha',
                  contentPadding:
                      EdgeInsets.all(16.0), // Espaçamento interno do TextField
                  border:
                      InputBorder.none, // Remove a borda padrão do TextField
                ),
                obscureText: true, // Para esconder a senha
              ),
            ),

            // Botão para ir para a tela de Lista de Tarefas
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListaTarefas(
                      listTarefas: [],
                    ), // Passa uma lista vazia como exemplo
                  ),
                );
              },
              child: Text('Login!'),
            ),
          ],
        ),
      ),
    );
  }
}
