import 'package:flutter/material.dart';
import 'package:my_project/ListaTarefas.dart';

class Login extends StatelessWidget {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

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
                size: 48.0,
                color: Color.fromARGB(255, 64, 5, 71),
              ),
            ),
            // Campo de entrada para login
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: Color.fromARGB(255, 196, 80, 191),
                  width: 3.0,
                ),
              ),
              child: TextField(
                key: const Key('login'),
                controller: _loginController,
                decoration: InputDecoration(
                  labelText: 'Login',
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Campo de entrada para senha
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: Color.fromARGB(255, 176, 52, 164),
                  width: 3.0,
                ),
              ),
              child: TextField(
                key: const Key('password'),
                controller: _senhaController,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  contentPadding: EdgeInsets.all(16.0),
                  border: InputBorder.none,
                ),
                obscureText: true,
              ),
            ),

            // Botão para ir para a tela de Lista de Tarefas
            ElevatedButton(
              key: const Key('confirm'),
              onPressed: () {
                final login = _loginController.text;
                final senha = _senhaController.text;

                if (login.isEmpty || senha.isEmpty) {
                  // Campos obrigatórios estão vazios
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Preencha todos os campos obrigatórios.'),
                    ),
                  );
                } else {
                  // Todos os campos estão preenchidos, navegue para a próxima tela
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ListaTarefas(
                        listTarefas: [],
                      ),
                    ),
                  );
                }
              },
              child: Text('Login!'),
            ),
          ],
        ),
      ),
    );
  }
}
