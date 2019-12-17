import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LadangPage extends StatefulWidget {
  final String title;

  LadangPage(this.title);

  @override
  _LadangPageState createState() {  
    return new _LadangPageState();
  }
}


class _LadangPageState extends State<LadangPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Harga Ladang'),
      ),
      
      body: StreamBuilder(
        stream: Firestore.instance.collection('sayurFama').snapshots(),
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
              Padding(padding: const EdgeInsets.all(10.0)),
              Text(snapshot.data.documents[6]['namaNegeri3'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[6]['namaSayur3'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[6]['hargaSayur3'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[7]['namaSayur3'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[7]['hargaSayur3'].toString()),
              Padding(padding: const EdgeInsets.all(8.0)),
              Text(snapshot.data.documents[8]['namaSayur3'],style: TextStyle(fontSize: 16)),
              Padding(padding: const EdgeInsets.all(4.0)),
              Text(snapshot.data.documents[8]['hargaSayur3'].toString()),
              Padding(padding: const EdgeInsets.all(10.0)),
            ],
          );
        }
      )
    
    );   
  }
}