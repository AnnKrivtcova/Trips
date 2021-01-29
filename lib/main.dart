import 'package:base_app_flutter/Add_form.dart';
import 'package:flutter/material.dart';
import 'Database.dart';
import 'ClientModel.dart';
import 'Add_form.dart';
import 'dart:math' as math;
import 'Description.dart';
import 'Add_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageViewDemo(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  List<String> testClients = [
    'https://images.unsplash.com/photo-1534445867742-43195f401b6c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80',
    'https://images.unsplash.com/photo-1414862625453-d87604a607e4?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/20190616154621%21Echo_Park_Lake_with_Downtown_Los_Angeles_Skyline.jpg/420px-20190616154621%21Echo_Park_Lake_with_Downtown_Los_Angeles_Skyline.jpg',
    'https://images.unsplash.com/photo-1570718669060-d85320ad5e3a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(top: 50,left: 20),
            child: Text(
              "My trips",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 100,bottom: 10),
            child: FutureBuilder<List<Client>>(
            future: DBProvider.db.getAllClients(),
            builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Client item = snapshot.data[index];
                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(color: Colors.red),
                      onDismissed: (direction) {
                        DBProvider.db.deleteClient(item.id);
                      },
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget> [
                              FlatButton(
                              onPressed: (){
                                String rnd = testClients[math.Random().nextInt(testClients.length)];
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Description(
                                  rnd,
                                  'https://www.pinclipart.com/picdir/big/6-64490_leaf-fall-leaves-clip-art-black-and-white.png',
                                  item.country,
                                  "${item.timeOfYear} ${item.year} - ${item.days} days",
                                  item.description,
                                  'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3b/POL_Warszawa_map.svg/497px-POL_Warszawa_map.svg.png',                          )));
                              },
                              child: Container(
                                clipBehavior : Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20))
                                ),
                                margin: EdgeInsets.only(bottom: 10),
                                child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                          'https://images.unsplash.com/photo-1570718669060-d85320ad5e3a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80',
                                          scale: 0.9,
                                          height: 180,
                                          width: MediaQuery.of(context).size.width,
                                          fit:BoxFit.cover
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 60,left: 10),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Image.network(
                                                  'https://www.pinclipart.com/picdir/big/6-64490_leaf-fall-leaves-clip-art-black-and-white.png',
                                                  width: 30,
                                                ),
                                                Text(
                                                  item.country,
                                                  style: TextStyle(fontSize: 30, color: Colors.white),
                                                ),
                                                Text(
                                                  "${item.timeOfYear} ${item.year} - ${item.days} days",
                                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                                ),
                                              ]
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
        ),
          ),
        ],
      ),
      floatingActionButton: AddButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) => MyForm()));
        },
      ),
    );
  }
}

class PageViewDemo extends StatefulWidget {
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {

  PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      children: [
        MainScreen(),
        MyForm(),
      ],
    );
  }
}
