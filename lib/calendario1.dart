import 'package:flutter/material.dart';
import 'package:my_project/ListaTarefas.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Calendário',
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
          TableCalendar(
            calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.white),
              selectedDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepPurple,
              ),
              selectedTextStyle: TextStyle(color: Colors.white),
            ),
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                  color: Colors
                      .white), // Define o estilo do texto do título como branco
              formatButtonTextStyle: TextStyle(
                  color: Colors
                      .white), // Define o estilo do texto do botão de formato como branco
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  color: Colors
                      .white), // Define o estilo do texto do dia da semana como branco
              weekendStyle: TextStyle(
                  color: Colors
                      .white), // Define o estilo do texto do fim de semana como branco
            ),
            firstDay: DateTime.utc(2021, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
              });
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListaTarefas(
                    selectedDay: selectedDay,
                    listTarefas: [],
                  ),
                ),
              );
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ],
      ),
    );
  }
}
