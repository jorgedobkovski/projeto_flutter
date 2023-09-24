import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String selectedOption = 'fogo';
  bool pedraChecked = false;
  bool papelChecked = false;
  bool tesouraChecked = false;
  double sliderValue = 0.0;

  _login(){
    String email = _emailController.text;
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(height: 20,),
                Text("Logando o usuário: " + email)
              ],
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 15, top: 30),
                        child: TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Email"
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15, top: 15),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Senha"
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 15, top: 15),
                        child: ElevatedButton(
                          child: Text(
                            "Login"
                          ),
                          onPressed: _login,
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Radio(
                                      value: 'fogo',
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text('Fogo'),
                                    Radio(
                                      value: 'agua',
                                      groupValue: selectedOption,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedOption = value!;
                                        });
                                      },
                                    ),
                                    Text('Água'),
                                  ],
                                ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Checkbox(
                              value: pedraChecked,
                              onChanged: (value) {
                                setState(() {
                                  pedraChecked = value!;
                                  if (value!) {
                                    papelChecked = false;
                                    tesouraChecked = false;
                                  }
                                });
                              },
                            ),
                              Text('Pedra'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: papelChecked,
                                onChanged: (value) {
                                  setState(() {
                                    papelChecked = value!;
                                    if (value!) {
                                      pedraChecked = false;
                                      tesouraChecked = false;
                                    }
                                  });
                                },
                              ),
                              Text('Papel'),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: tesouraChecked,
                                onChanged: (value) {
                                  setState(() {
                                    tesouraChecked = value!;
                                    if (value!) {
                                      pedraChecked = false;
                                      papelChecked = false;
                                    }
                                  });
                                },
                              ),
                              Text('Tesoura'),
                            ],
                          ),
                        ],
                      ),
                      Slider(
                        value: sliderValue,
                        onChanged: (newValue) {
                          setState(() {
                            sliderValue = newValue;
                          });
                        },
                        min: 0.0,
                        max: 1.0,
                      ),
                    ]
                ),
              )
          ),
        ),
      ),
    );
  }
}
