import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'fancy_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';

class Description extends StatelessWidget {
  String mainPhoto;
  String timeOfYearPhoto;
  String countryName;
  String period;
  String description;
  String map;
  Description(String mainPhoto,  String timeOfYearPhoto, String countryName, String period, String description, String map){
    this.mainPhoto = mainPhoto;
    this.countryName = countryName;
    this.period = period;
    this.timeOfYearPhoto = timeOfYearPhoto;
    this.description = description;
    this.map = map;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                clipBehavior : Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                ),
                margin: EdgeInsets.only(top: 0),
                child: Stack(
                    children: <Widget>[
                      Image.network(
                        mainPhoto,
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          fit:BoxFit.cover
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 200,left: 40),
                        child: Container(
                          //color: Colors.teal,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.network(
                                  timeOfYearPhoto,
                                  width: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Text(
                                    countryName,
                                    style: TextStyle(fontSize: 40, color: Colors.white,fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  period,
                                  style: TextStyle(fontSize: 18, color: Colors.white),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ]
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30,left: 20,right: 20,bottom: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "The best happy holiday in $countryName",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
                        ),
                        Text(
                          description,
                          style: TextStyle(fontSize: 20, color: Colors.black45),
                        )
                      ]
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Image.network(
                      map
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FancyButton(
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}