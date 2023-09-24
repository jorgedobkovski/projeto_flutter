import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JOOJ"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset(
                  "images/helloween-logo.png",
                  width: 200,
                  height: 100,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, "/jokenpo");
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                            child: Text(
                              "Jogar JokenPo",
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, "/form");
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          child: Text(
                            "Acessar Form",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
