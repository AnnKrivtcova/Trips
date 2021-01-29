import 'package:base_app_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'ClientModel.dart';
import 'Database.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: AddForm(),
      ),
    );
  }
}

class AddForm extends StatefulWidget{
  @override
  _AddFormState createState(){
    return _AddFormState();
  }
}

class _AddFormState extends State<AddForm>{
  String _radioValue = "Autumn";

  final _formKey = GlobalKey<FormState>();
  final countryController = TextEditingController();
  final descriptionController = TextEditingController();
  final daysController = TextEditingController();
  final yearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Stack(
        children: <Widget> [
          Container(
          padding: EdgeInsets.only(top: 60),
            alignment: Alignment.topCenter,
            child: Text(
              'Fill the form',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 120,left: 20),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    Container(
                      width: 300,
                      child: TextFormField(
                        cursorColor: Colors.deepPurple,
                        controller: countryController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          icon: Icon(
                              Icons.map,
                            color: Colors.deepPurple,
                          ),
                          hintText: "What country have you visited?",
                          labelText: "Country*",
                          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.deepPurple,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          ),
                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        cursorColor: Colors.deepPurple,
                        controller: descriptionController,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.description,
                            color: Colors.deepPurple,
                          ),
                          hintText: "About the country",
                          labelText: "Description*",
                          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          ),

                        ),
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        cursorColor: Colors.deepPurple,
                        controller: daysController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_view_day,
                            color: Colors.deepPurple,
                          ),
                          hintText: "How many days did you travel?",
                          labelText: "Days*",
                          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          ),

                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter some number';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        cursorColor: Colors.deepPurple,
                        controller: yearController,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.deepPurple,
                          ),
                          hintText: "What year?",
                          labelText: "Year*",
                          labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.deepPurple,
                              )
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide()
                          ),

                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                        validator: (value){
                          if(value.isEmpty){
                            return 'Please enter some number';
                          }
                          else{
                            var valueInt = int.parse(value);
                            if(valueInt<1950 || valueInt >2021){
                              return 'Enter number between 1950 and 2021';
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  "Time of year:",
                                style: TextStyle(fontSize: 20),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50),
                                child: Row(
                                children: <Widget>[
                                    Radio(
                                      value: "Autumn",
                                      groupValue: _radioValue,
                                      onChanged: (String value) {
                                        setState(() {
                                          _radioValue = value;
                                        });
                                      },
                                      activeColor: Colors.deepPurple,
                                    ),
                                  Text(
                                      "Autumn",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Radio(
                                      value: "Winter",
                                      groupValue: _radioValue,
                                      onChanged: (String value) {
                                        setState(() {
                                          _radioValue = value;
                                        });
                                      },
                                      activeColor: Colors.deepPurple,
                                    ),
                                  Text(
                                      "Winter",
                                    style: TextStyle(fontSize: 16),
                                  ),

                                ],
                            ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 50),
                                child: Row(
                                    children: <Widget>[
                                      Radio(
                                        value: "Spring",
                                        groupValue: _radioValue,
                                        onChanged: (String value) {
                                          setState(() {
                                            _radioValue = value;
                                          });
                                        },
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                          "Spring",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Radio(
                                        value: "Summer",
                                        groupValue: _radioValue,
                                        onChanged: (String value) {
                                          setState(() {
                                            _radioValue = value;
                                          });
                                        },
                                        activeColor: Colors.deepPurple,
                                      ),
                                      Text(
                                          "Summer",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ]
                                ),
                              ),
                            ]
                          ),
                        ),
                    /*Container(
                      padding: EdgeInsets.only(top: 30,left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              "Date:",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          Container(
                          padding: EdgeInsets.only(top: 10),
                          height: 60,
                          width: 250,
                            child: CupertinoTheme(
                            data: CupertinoThemeData(
                              textTheme: CupertinoTextThemeData(
                                dateTimePickerTextStyle: TextStyle(fontSize: 18)
                              )
                            ),
                              child: CupertinoDatePicker(
                                mode: CupertinoDatePickerMode.date,
                                initialDateTime: DateTime(2021,1,1),
                                onDateTimeChanged: (DateTime newDateTime){},
                              ),
                          ),
                        ),

                        ]
                      ),
                    ),*/
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 40,top: 20),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if(_formKey.currentState.validate()){
                              var daysInt = int.parse(daysController.text);
                              var yearInt = int.parse(yearController.text);
                              String photo;
                              switch(_radioValue){
                                case "Spring":
                                  photo = 'https://www.pinclipart.com/picdir/big/552-5521146_clipart-black-and-white-bird-shape-png-download.png';
                                  break;
                                case "Winter":
                                  photo = 'https://www.pinclipart.com/picdir/big/521-5219092_snowflake-words-clipart-clip-art-royalty-free-download.png';
                                  break;
                                case "Autumn":
                                  photo = 'https://www.pinclipart.com/picdir/big/6-64490_leaf-fall-leaves-clip-art-black-and-white.png';
                                  break;
                                  case "Summer":
                                    photo = 'https://www.pinclipart.com/picdir/big/58-583041_white-sun-transparent-clipart.png';
                                    break;
                              }
                                Client rnd = Client(description: descriptionController.text, country: countryController.text, days: daysInt,year: yearInt, timeOfYear: _radioValue,timeOfYearPhoto: photo,blocked: false);
                                await DBProvider.db.newClient(rnd);
                                setState(() {});
                                Navigator.push(context,MaterialPageRoute(builder: (context) => MyApp()));
                              //Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                            }

                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed))
                                  return Colors.deepPurple[400];
                                else
                                  return Colors.deepPurple;
                                return null; // Use the component's default.
                              },
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]
        ),
    );
  }
}