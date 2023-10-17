import 'package:flutter/material.dart';
import 'package:my_project/AddTarefas.dart';
import 'package:my_project/RemoverTarefas.dart';

class ListaTarefas extends StatefulWidget {
  final DateTime selectedDay;

  ListaTarefas({required this.selectedDay, required List listTarefas});

  @override
  ListaTarefasState createState() => ListaTarefasState();
}

class ListaTarefasState extends State<ListaTarefas> {
  List<String> listTarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Lista de Tarefas',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final novaTarefa = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTarefas(),
                ),
              );

              if (novaTarefa != null) {
                setState(() {
                  listTarefas.add(novaTarefa);
                });
              }
            },
            color: Colors.white,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RemoverTarefas(
                    listTarefas: listTarefas,
                    atualizarListaTarefas: (novaLista) {
                      setState(() {
                        listTarefas.clear();
                        listTarefas.addAll(novaLista);
                      });
                    },
                  ),
                ),
              );
            },
            color: Colors.white,
          ),
        ],
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
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: Colors.purple,
                  width: 3.0,
                ),
              ),
              child: listTarefas.isEmpty
                  ? Text(
                      'Nenhuma tarefa na lista',
                      style: TextStyle(color: Colors.white),
                    )
                  : ListView.builder(
                      itemCount: listTarefas.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.purple,
                              width: 3,
                            ),
                          ),
                          child: ListTile(
                            title: Text(listTarefas[index]),
                            textColor: Colors.white,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
