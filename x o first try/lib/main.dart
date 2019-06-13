import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'X O Game',
      home: MainApp(),
      theme: ThemeData(
          primaryColor: Colors.teal[900], accentColor: Colors.lightGreen[700]),
    ));

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {
  var counter = 0;
  String alpha = "";
  String alpha1 ="";
  String alpha2 ="";
  String alpha3 ="";
  String alpha4 ="";
  String alpha5 ="";
  String alpha6 ="";
  String alpha7 ="";
  String alpha8 ="";
  String alpha9 ="";
  String who = "X";
  num win=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(child: Text( massege(),
        ),),
      ),
        body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/paper.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child:
          Opacity(
          opacity: 1,
          child:GridView.count(
          //mainAxisSpacing: 1.0,
          primary: false,
          padding: const EdgeInsets.only(right:10.0,left: 10.0, top: 80.0, bottom: 80.0),
          //crossAxisSpacing: 1.0,
          crossAxisCount: 3,
          children: <Widget>[
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              onPressed: () {
                setState((){
                  if(alpha1==""){
                alpha1=changeText();}
                });                
              },
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha1 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha2 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha2==""){
                alpha2=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha3 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha3==""){
                alpha3=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha4 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha4==""){
                alpha4=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha5 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha5==""){
                alpha5=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha6 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha6==""){
                alpha6=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha7 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha7==""){
                alpha7=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha8 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha8==""){
                alpha8=changeText();}
                });                
              },
            ),),
            Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              
              color: Theme.of(context).primaryColor,
              child: Text(
                alpha9 ,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              onPressed: () {
                setState((){
                if(alpha9==""){
                alpha9=changeText();}
                });                
              },
            ),),
          ],
        
        
        
        ),
        ),
          
        )
        );
  }
  String changeText(){
    changeWho();
    checkWinner();
    if(counter == 0 ){
      counter = 1;
      return "X";
    }
    else if(counter == 1){
      counter=0;
      return "O";
    }
  }
  String changeWho(){
    if(counter == 1){
      return who = "X";
    }
    else{
      return who = "O";
    }
  }
  String massege(){
    if (win == 0)
    {
      return "This Turn for Player $who";
    }
    else if(win == 1){
      return "Player $alpha win";
    }
    else if(win == -1){
      return "Draw";
    }
  }
  
  void reset(){
  counter = 0;
  alpha = "";
  alpha1 ="";
  alpha2 ="";
  alpha3 ="";
  alpha4 ="";
  alpha5 ="";
  alpha6 ="";
  alpha7 ="";
  alpha8 ="";
  alpha9 ="";
  who = "X";
  win=0;
  }

  
  void checkWinner(){
    String winner;
    void checkPlayer(a){
    if(a =="X"){
      winner = "X";
    }
    else if(a == "O"){
      winner = "O";
    }
    }
    void result(){
      reset();
      showDialog(
        context: context,
        builder: (_)=> AlertDialog(
          title: Text("End of Game"),
          content: Text("Player $winner  win the game"), 
        ),
              );
    }
    if(alpha1 == alpha2 && alpha2== alpha3 && alpha1 !="" ){
       checkPlayer(alpha1); result();
    }
    if(alpha4 == alpha5 && alpha5== alpha6 && alpha4 !="" ){
       checkPlayer(alpha4); result();
    }
    if(alpha7 == alpha8 && alpha8== alpha9 && alpha7 !="" ){
       checkPlayer(alpha7); result();
    }
    if(alpha1 == alpha4 && alpha4== alpha7 && alpha1 !="" ){
       checkPlayer(alpha1); result();
    }
    if(alpha2 == alpha5 && alpha5== alpha8 && alpha2 !="" ){
       checkPlayer(alpha2); result();
    }
    if(alpha3 == alpha6 && alpha6== alpha9 && alpha3 !="" ){
       checkPlayer(alpha3); result();
    }
    if(alpha1 == alpha5 && alpha5== alpha9 && alpha1 !="" ){
       checkPlayer(alpha1); result();
    }
    if(alpha3 == alpha5 && alpha5== alpha7 && alpha3 !="" ){
       checkPlayer(alpha3); result();
    }
    else if(alpha1 !="" && alpha2 !="" && alpha3 !="" && alpha4 !="" && alpha5 !="" && alpha6 !="" && alpha7 !="" && alpha8 !="" && alpha9 !=""){
      win = -1;
    }
    
  }
}



