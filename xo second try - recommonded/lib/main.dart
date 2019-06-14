import 'package:flutter/material.dart';
import 'package:xo/screens/customDialog.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      title: 'X O Game',
      home: MainApp(),
      theme: ThemeData(
          primaryColor: Colors.teal[900], accentColor: Colors.lightGreen[700]),
));
class GameButtons{
  final id;
  String letter;
  bool enabel ;

  GameButtons(this.id , {this.letter: "", this.enabel :true});

}
class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainApp();
  }
}

class _MainApp extends State<MainApp> {
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
      return "Next Game for Player X";
    }
    else{
      return "Next Game for Player O";
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
    });
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
           "Player X won press the reset button to restart the game" , resetGame)
        );
      }if(winner == 2){
        showDialog(
          context: context , 
          builder: (_)=> CustomDialog("Game Over",
           "Player O won press the reset button to restart the game" , resetGame)
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
              color: Theme.of(context).primaryColor,
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

        floatingActionButton: FloatingActionButton(
		    onPressed: () {
          resetGame();
		    },

		    tooltip: 'reset',

		    child: Icon(Icons.settings_backup_restore),
        backgroundColor: Theme.of(context).primaryColor,

	    ),
    );
}
}


