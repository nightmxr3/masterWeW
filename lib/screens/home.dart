import 'package:flutter/material.dart';
import 'package:recipes/screens/details.dart';
import 'package:recipes/utils/data.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    
    var body = Container(

      color: Theme.of(context).primaryColor,
      child: GridView.builder(
          shrinkWrap: false,
          itemCount: Data.recipes.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                recipe: Data.recipes[index],
                              )));
                },
                child: Card(
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 50,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                            child: Hero(
                              tag: Data.recipes[index].id,
                              child: FadeInImage(
                                image:
                                    NetworkImage(Data.recipes[index].imageUrl),
                                fit: BoxFit.cover,
                                placeholder:
                                    AssetImage('assets/images/loading.gif'),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            Data.recipes[index].title,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),                            
                        ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HARGA PASAR TANI'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
              drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("Muhd Fadhli"),
                accountEmail: new Text("example@gmail.com"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text("P"),
                ),
                otherAccountsPictures: <Widget>[
                  new CircleAvatar(
                    backgroundColor: Colors.white,
                    child: new Text("K"),
                  )
                ],
              ),
              new ListTile(
                title: new Text("Info Korporat"),
                trailing: new Icon(
                  Icons.store,
                  color: Colors.deepOrangeAccent,
                  size: 36.0,
                ),
                onTap: () => Navigator.of(context).pushNamed("/a"),
              ),
                new ListTile(
                title: new Text("Maklum Balas"),
                trailing: new Icon(
                  Icons.arrow_downward
                  ),
                  onTap: () => Navigator.of(context).pushNamed("/b"),
              ),
                new ListTile(
                title: new Text("Close"),
                trailing: new Icon(Icons.close),
                onTap: () =>Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      body: body,
    );
  }
}
