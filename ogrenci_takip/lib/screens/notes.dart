import 'dart:math';

import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    if (task.length > 0) {
      setState(() => _todoItems.add(task));
    }
  }
//
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(title: new Text('Not Defteri')),
      body: _buildTodoList(),
      floatingActionButton:
          new FloatingActionButton(onPressed: _pushAddTodoScreen, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(title: new Text('Yeni bir not ekle')),
          body: new TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context); // Close the add todo screen
            },
            decoration: new InputDecoration(hintText: 'yeni not...', contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
              title: new Text('Seçtiğiniz not: "${_todoItems[index]}" silinsin mi?'),
              actions: <Widget>[
                new FlatButton(child: new Text('HAYIR'), onPressed: () => Navigator.of(context).pop()),
                new FlatButton(
                    child: new Text('EVET'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return new Container(
      child: Center(
        child: ListTile(
            tileColor: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            title: new Text(todoText),
            onTap: () => _promptRemoveTodoItem(index)),
      ),
    );
  }
}
