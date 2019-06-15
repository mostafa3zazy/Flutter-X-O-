import 'package:flutter/material.dart';
import 'package:xo/screens/ComputerVsPlayer.dart';
import 'package:xo/screens/playerVsPlayer.dart';

class Acess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Acess();
  }
}

class _Acess extends State<Acess> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/paper.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Opacity(
                        opacity: 0.9,
                        child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ComputerVsPlayer();
                            }));
                          },
                          color: Theme.of(context).accentColor,
                          padding: EdgeInsets.only(top: 60.0, bottom: 60.0),
                          child: Text(
                            "One Player",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontFamily: "IndieFlower",
                            ),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: 0.9,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return PlayerVsPlayer();
                            }));
                          },
                          color: Theme.of(context).primaryColor,
                          padding: EdgeInsets.only(top: 60.0, bottom: 60.0),
                          child: Text(
                            "Two Player",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50.0,
                              fontFamily: "IndieFlower",
                            ),
                          ),
                        ),
                      ),
                    ]),
              ]),
        ),
      ),
    );
  }
}
