import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xo/screens/customDialog.dart';


class GameButtons{
  final id;
  String letter;
  bool enabel ;

  GameButtons(this.id , {this.letter: "", this.enabel :true});

}
class ComputerVsPlayer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ComputerVsPlayer();
  }
}

class _ComputerVsPlayer extends State<ComputerVsPlayer> {
  var p1;
  var p2;
  var activeP;
  int l=0;
  List<GameButtons> buttonsList;
  @override
  void initState() {
    super.initState();
    buttonsList = doInit();
  }

  List<GameButtons> doInit(){
    p1 = new List();
    p2 = new List();
    activeP = 1;
    


    var gameButtons = <GameButtons>[
      
      GameButtons(1),
      GameButtons(2),
      GameButtons(3),
      GameButtons(4),
      GameButtons(5),
      GameButtons(6),
      GameButtons(7),
      GameButtons(8),
      GameButtons(9),
    ];
    return gameButtons;
  }

  String whoPlay(){
    if(activeP == 1){
      return "Your Turn";
    }
    else{
      return "Computer Turn";
    }
  }
  void playGame(GameButtons hg){
    setState(() {
      if(activeP == 1){
        hg.letter = "X";
        activeP = 2;
        p1.add(hg.id);
        l++;
      } else{
        hg.letter = "O";
        activeP = 1;
        p2.add(hg.id);
        l++;
      }
      hg.enabel = false;
      checkWinner();
      if(activeP ==2 && l<8){
      autoPlay();}
    });
  }
  void autoPlay(){
    var emptyCells = new List();
    var list = new List.generate(9, (i)=>i+1);
    for (var cellId in list) {
      if(!(p1.contains(cellId) || p2.contains(cellId))){
        emptyCells.add(cellId);
      }      
    }

    var r= Random();
    var randIndex = r.nextInt(emptyCells.length-1);
    var cellId = emptyCells[randIndex];
    int i = buttonsList.indexWhere((p)=>p.id == cellId);
    playGame(buttonsList[i]);
  }
  void checkWinner(){
    var winner = -1;
    if(p1.contains(1) && p1.contains(2) && p1.contains(3)){
      winner =1;
    }
    if(p2.contains(1) && p2.contains(2) && p2.contains(3)){
      winner =2;
    }

    if(p1.contains(4) && p1.contains(5) && p1.contains(6)){
      winner =1;
    }
    if(p2.contains(4) && p2.contains(5) && p2.contains(6)){
      winner =2;
    }

    if(p1.contains(7) && p1.contains(8) && p1.contains(9)){
      winner =1;
    }
    if(p2.contains(7) && p2.contains(8) && p2.contains(9)){
      winner =2;
    }

    if(p1.contains(1) && p1.contains(4) && p1.contains(7)){
      winner =1;
    }
    if(p2.contains(1) && p2.contains(4) && p2.contains(7)){
      winner =2;
    }

    if(p1.contains(2) && p1.contains(5) && p1.contains(8)){
      winner =1;
    }
    if(p2.contains(2) && p2.contains(5) && p2.contains(8)){
      winner =2;
    }

    if(p1.contains(3) && p1.contains(6) && p1.contains(9)){
      winner =1;
    }
    if(p2.contains(3) && p2.contains(6) && p2.contains(9)){
      winner =2;
    }

    if(p1.contains(1) && p1.contains(5) && p1.contains(9)){
      winner =1;
    }
    if(p2.contains(1) && p2.contains(5) && p2.contains(9)){
      winner =2;
    }

    if(p1.contains(3) && p1.contains(5) && p1.contains(7)){
      winner =1;
    }
    if(p2.contains(3) && p2.contains(5) && p2.contains(7)){
      winner =2;
    }

    if(l == 9 && winner == -1){
        showDialog(
          context: context , 
          builder: (_)=> CustomDialog("Game Over",
           "Draw press the reset button to restart the game" , resetGame)
        );
      }
    

    if(winner != -1){
      if(winner == 1){
        showDialog(
          context: context , 
          builder: (_)=> CustomDialog("Game Over",
           "You won The Game press the reset button to restart the game" , resetGame)
        );
      }if(winner == 2){
        showDialog(
          context: context , 
          builder: (_)=> CustomDialog("Game Over",
           "Computer won The Game press the reset button to restart the game" , resetGame)
        );
      }
    }

  }

  void resetGame(){
    l=0;
    if(Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonsList= doInit(); 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).accentColor,
      title: Center(child: Text( whoPlay()
        ),),
      ),
        body:Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/paper.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
          child:GridView.builder(
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 3,
           ),

          primary: false,
          padding: const EdgeInsets.only(right:10.0,left: 10.0, top: 80.0, bottom: 80.0),
          itemCount: buttonsList.length,
          itemBuilder: (context , i ) => Container(
            decoration: BoxDecoration(
            border:  Border.all(color: Colors.white)
            ),
             child:RaisedButton(
              onPressed: () {
                if(buttonsList[i].enabel){
                playGame(buttonsList[i]);
                }
              },
              color: Theme.of(context).accentColor,
              child: Text(buttonsList[i].letter,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100.0,
                  fontFamily: "IndieFlower",
                ),
              ),
              
            ),),

        )
        ),
        RaisedButton(
          child: Text("Go Back" , style:TextStyle(color: Colors.white , fontSize:20.0 )),
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20.0),
          onPressed: (){
            if(Navigator.canPop(context)) Navigator.pop(context);
            setState(() {
             buttonsList= doInit();

            });
            },
        )
        ] ),
        ),

       
    );
}
}


