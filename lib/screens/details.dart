import 'package:flutter/material.dart';
import 'package:recipes/utils/class.dart';
import 'package:recipes/utils/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailsPage extends StatefulWidget {
  final Recipe recipe;
  DetailsPage({this.recipe});

  @override
  _DetailsPageState createState() { return new _DetailsPageState();}
}

class _DetailsPageState extends State<DetailsPage> {
  String myText, myNum;

    final DocumentReference documentReference =
      Firestore.instance.document("sayurFama/8W21UWLMP7Mkq8qTYpNv");

//    void _fetch() {
  //  documentReference.get().then((datasnapshot) {
    //  if (datasnapshot.exists) {
      //  setState(() {
       //   myText = datasnapshot.data['namaSayur'];
       //   myNum = datasnapshot.data['hargaSayur'];
      //  });
    //  }
   // });
 // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              title: Text(widget.recipe.title),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: widget.recipe.id,
                  child: FadeInImage(
                    image: NetworkImage(
                        widget.recipe.imageUrl),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('Khasiat',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                NutritionWidget(
                  nutrients: widget.recipe.nutrients,
                ),
                Text('Sumber Vitamin',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                IngredientsWidget(
                  ingredients: widget.recipe.ingredients,
                ),
           new RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed("/c"),
              child: new Text("Harga Ladang"),
              color: Colors.lime,
            ),
              new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed("/d"),
              child: new Text("Harga Borong"),
              color: Colors.blueAccent,
            ),
              new Padding(
              padding: const EdgeInsets.all(10.0),
            ),
            new RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed("/e"),
              child: new Text("Harga Runcit"),
              color: Colors.redAccent
            ),
            myText == null? new Container():new Text(myText,style: new TextStyle(fontSize: 20.0),
            ),
            myNum == null? new Container():new Text(myNum,style: new TextStyle(fontSize: 20.0),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeSteps extends StatelessWidget {
  final List<String> steps;
  RecipeSteps({this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Theme.of(context).accentColor,
                child: Text('${index + 1}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(steps[index],
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final List<String> ingredients;
  IngredientsWidget({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: ingredients.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
              backgroundColor: Theme.of(context).accentColor,
              label: Text(ingredients[index],
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          );
        },
      ),
    );
  }
}

class NutritionWidget extends StatelessWidget {
  final List<Nutrients> nutrients;
  NutritionWidget({this.nutrients});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: double.infinity,
      child: ListView.builder(
        itemCount: nutrients.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CircleIndicator(percent: nutrients[index].percent,nutrient: nutrients[index],);
        },
      ),
    );
  }
}
