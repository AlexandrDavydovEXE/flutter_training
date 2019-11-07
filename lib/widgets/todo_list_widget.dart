import 'package:flutter/material.dart';

class MyTodo extends StatefulWidget {
  @override
  State<StatefulWidget>createState() {
    return MyTodoState();
  }
}

class MyTodoState extends State<MyTodo> {
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Todo made by Alex")),
        body: _buildList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addNewItem(context),
          tooltip: 'Add',
          child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList() {

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
                icon: Icon(Icons.content_cut),
              onPressed: () {
                  print(items[index]);
                  setState(() {
                    items.remove(items[index]);
                  });
              },
            ),
        );
      }
    );
  }



  TextEditingController _textFieldController = TextEditingController();

  _addNewItem(BuildContext context) {
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text('type new Todo'),
          content: TextField(
            controller: _textFieldController,
            decoration: InputDecoration(hintText: 'Put some action here'),
          ),
          actions:<Widget>[
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('Add'),
              onPressed: () {
                setState(() {
                  if(_textFieldController.text.length > 0) {
                    items.add(_textFieldController.text);
                    _textFieldController.clear();
                  }
                });
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }
}

