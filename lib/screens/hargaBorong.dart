import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BorongPage extends StatefulWidget {
  final String title;

  BorongPage(this.title);

  @override
  _BorongPageState createState() {  
    return new _BorongPageState();
  }
}


class _BorongPageState extends State<BorongPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Harga Borong'),
      ),
      
      body: StreamBuilder(
        stream: Firestore.instance.collection('hargaBorong').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Text('Loading data.. Please wait..');
          return Column(
            
            children: <Widget>[
              Text(snapshot.data.documents[0]['tarikh'],style: TextStyle(fontSize: 16)), 
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[0]['namaNegeri'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[0]['namaSayur'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[0]['hargaSayur'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[1]['namaSayur'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[1]['hargaSayur'].toString()),  
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[2]['namaSayur'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[2]['hargaSayur'].toString()),            
              Padding(padding: const EdgeInsets.all(10.0)),
              Text(snapshot.data.documents[3]['namaNegeri2'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[3]['namaSayur2'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[3]['hargaSayur2'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[4]['namaSayur2'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[4]['hargaSayur2'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[5]['namaSayur2'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[5]['hargaSayur2'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),


            ],
          );
        }
      )
    
    );   
  }
}