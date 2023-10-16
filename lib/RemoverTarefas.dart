import 'package:flutter/material.dart';

class RemoverTarefas extends StatelessWidget {
  final List<String> listTarefas;
  final Function(List<String>) atualizarListaTarefas;

  RemoverTarefas({
    required this.listTarefas,
    required this.atualizarListaTarefas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Remover Tarefas',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.purple, Colors.black],
          ),
        ),
        child: Center(
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
                      return GestureDetector(
                        onTap: () {
                          _removerTarefa(context, index);
                        },
                        child: Container(
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
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }

  void _removerTarefa(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover Tarefa'),
          content: Text('Tem certeza que deseja remover esta tarefa?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                listTarefas.removeAt(index);
                atualizarListaTarefas(
                    listTarefas); // Atualize a lista de tarefas
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('Remover'),
            ),
          ],
        );
      },
    );
  }
}
