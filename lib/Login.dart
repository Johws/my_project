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
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300, // Largura do contêiner branco
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white, // Cor de fundo branca
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(
                        12.0), // Espaçamento interno para criar uma forma quadrada
                    decoration: BoxDecoration(
                      color: Colors.white, // Cor de fundo branca
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 48.0,
                      color: Colors.purple,
                    ),
                  ),
                  SizedBox(height: 10), // Espaçamento entre os elementos
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
                  SizedBox(height: 10), // Espaçamento entre os elementos
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
                  SizedBox(height: 20), // Espaçamento entre os elementos
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
                        Color.fromARGB(255, 174, 19, 198),
                      ),
                    ),
                    child: Text(
                      'Login!',
                      style: TextStyle(
                        color: const Color.fromARGB(236, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
