import 'package:flutter/material.dart';
import 'package:my_project/ListaTarefas.dart';

class Login extends StatelessWidget {
  final _loginController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text('Login'),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.purple, Colors.black],
              )),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.person,
                      size: 48.0,
                      color: Colors.purpleAccent,
                    ),
                  ),
                  // Campo de entrada para login
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Colors.purpleAccent,
                        width: 3.0,
                      ),
                    ),
                    child: TextField(
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
                        color: Colors.purpleAccent,
                        width: 3.0,
                      ),
                    ),
                    child: TextField(
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
                    onPressed: () {
                      final login = _loginController.text;
                      final senha = _senhaController.text;

                      if (login.isEmpty || senha.isEmpty) {
                        // Campos obrigatórios estão vazios
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Preencha todos os campos obrigatórios.'),
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
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purpleAccent,
                      ),
                    ),
                    child: Text('Login!'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
