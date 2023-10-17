import 'package:flutter/material.dart';

class AddTarefas extends StatefulWidget {
  @override
  AddTarefasState createState() => AddTarefasState();
}

class AddTarefasState extends State<AddTarefas> {
  TextEditingController controller = TextEditingController();
  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Adicionar Tarefa',
          style: TextStyle(color: Colors.white),
        ),
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
              width: 400,
              height: 350,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Colors.purple,
                        width: 3.0,
                      ),
                    ),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        labelText: 'Tarefa',
                        border: InputBorder.none,
                        errorText: showError ? 'Campo obrigatório' : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      String taskText = controller.text.trim();
                      if (taskText.isNotEmpty) {
                        Navigator.pop(context, taskText);
                      } else {
                        setState(() {
                          showError = true;
                        });
                      }
                    },
                    child: Text('Adicionar Tarefa'),
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
