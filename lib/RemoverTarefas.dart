import 'package:flutter/material.dart';

// Classe 4: Remover Tarefa

class RemoverTarefa extends StatefulWidget {
  @override
  RemoverTarefaState createState() => RemoverTarefaState();
}

class RemoverTarefaState extends State<RemoverTarefa> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          elevation: 4,
          title: Text(
            'Remover Tarefa',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.purple),
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
        ],
      ),
    );
  }
}
