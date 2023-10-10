import 'package:flutter/material.dart';

// Classe 4: Remover Tarefa

class RemoverTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remover Tarefa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Lista de Tarefas para Remover'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Remover Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
