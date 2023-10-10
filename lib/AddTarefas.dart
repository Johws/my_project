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
        title: Text('Adicionar Tarefa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(
                  color: const Color.fromARGB(255, 191, 33, 243),
                  width: 3.0,
                ),
              ),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Tarefa',
                  border: InputBorder
                      .none, // Define a borda do TextField como nenhuma
                  errorText: showError ? 'Campo obrigatório' : null,
                ),
              ),
            ),
            SizedBox(height: 50.0), // Espaço entre o TextField e o botão
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
    );
  }
}
