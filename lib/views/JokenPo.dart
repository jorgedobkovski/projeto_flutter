import 'dart:math';

import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  const JokenPo({super.key});

  @override
  State<JokenPo> createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {

  var _image = AssetImage("images/padrao.png");
  var _text = "Escolha uma opção abaixo";

  void _selectedOption(String option){
    var options = [
      "rock",
      "paper",
      "scissor"
    ];

    var rd = Random().nextInt(3);

    var appChoice = options[rd];

    switch(appChoice){
      case "rock":
        setState((){
          this._image = AssetImage("images/pedra.png");
        });
        break;
      case "paper":
        setState((){
          this._image = AssetImage("images/papel.png");
        });
        break;
      case "scissor":
        setState((){
          this._image = AssetImage("images/tesoura.png");
        });
        break;
    }

    if (
    (option == "rock" && appChoice == "scissor") ||
        (option == "scissor" && appChoice == "paper") ||
        (option == "paper" && appChoice == "rock")
    ){
      setState((){
        this._text = "Você venceu!";
      });
    } else if (
    (appChoice == "rock" && option == "scissor") ||
        (appChoice == "scissor" && option == "paper") ||
        (appChoice == "paper" && option == "rock")
    ){
      setState((){
        this._text = "Você perdeu!";
      });
    } else{
      setState((){
        this._text = "Você empatou!";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "JokenPo"
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "Escolha do JOOJ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image(image: _image),
            Text(
              _text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => _selectedOption("rock"),
                  child: Image.asset(
                    "images/pedra.png",
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectedOption("paper"),
                  child: Image.asset(
                    "images/papel.png",
                    width: 100,
                  ),
                ),
                GestureDetector(
                  onTap: () => _selectedOption("scissor"),
                  child: Image.asset(
                    "images/tesoura.png",
                    width: 100,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
