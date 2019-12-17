import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RuncitPage extends StatefulWidget {
  final String title;

  RuncitPage(this.title);

  @override
  _RuncitPageState createState() {  
    return new _RuncitPageState();
  }
}


class _RuncitPageState extends State<RuncitPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Harga Runcit'),
      ),
      
      body: StreamBuilder(
        stream: Firestore.instance.collection('hargaRuncit').snapshots(),
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
              Text(snapshot.data.documents[1]['namaSayur2'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[1]['hargaSayur2'].toString()),  
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[2]['namaSayur3'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[2]['hargaSayur3'].toString()),            
              Padding(padding: const EdgeInsets.all(10.0)),
              Text(snapshot.data.documents[3]['namaNegeri'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[3]['namaSayur'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[3]['hargaSayur'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[4]['namaSayur2'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[4]['hargaSayur2'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[5]['namaSayur3'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[5]['hargaSayur3'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),


            ],
          );
        }
      )
    
    );   
  }
}