import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NextPage extends StatefulWidget {
  final String title;

  NextPage(this.title);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  String myText;
  String newTask='';
  DateTime _dueDate=new DateTime.now();
  String _dateText='';

  Future<Null> _selectDueDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate,
      firstDate: DateTime(2019),
      lastDate: DateTime(2080)
    );

    if(picked !=null){
      setState(() {
        _dueDate=picked;
        _dateText = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

@override
 void initState(){

   super.initState();
   _dateText = "${_dueDate.day}/${_dueDate.month}/${_dueDate.year}";
 }
  

  void _add() {
    Firestore.instance.runTransaction((Transaction transsaction) async{
      CollectionReference reference = Firestore.instance.collection('feedback');
      await reference.add({
        "form" : newTask,
        "duedate" : _dateText
      });
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Maklum Balas'),
      ),
      body: 
      new Padding(
        padding: const EdgeInsets.all(10.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new Icon(Icons.date_range),
            new Expanded(child:Text("Due Date", style: new TextStyle(fontSize: 22.0, color: Colors.black54)),),
            new FlatButton(
              onPressed: ()=>_selectDueDate(context),
              child:Text(_dateText, style: new TextStyle(fontSize: 22.0, color: Colors.black54)),),
            TextField(
              onChanged: (String str){
                setState(() {
                  newTask=str;
                });
              },
              decoration: InputDecoration(
                icon: Icon(Icons.note),
                labelText: 'Masukkan maklum balas anda di sini..',
  ),
),
            new RaisedButton(
              onPressed: (){
                _add();
              },
              child: new Text("Hantar"),
              color: Colors.cyan,
            ),
              ]
              
            )
             
          )
      );
  }
    
  }
  
