import 'package:flutter/material.dart';
import 'package:projeto_simples_em_flutter/views/Formulario.dart';
import 'package:projeto_simples_em_flutter/views/Index.dart';
import 'package:projeto_simples_em_flutter/views/JokenPo.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name) {
      case "/index":
        return MaterialPageRoute(
            builder: (_) => Index()
        );
      case "/jokenpo":
        return MaterialPageRoute(
            builder: (_) => JokenPo()
        );
      case "/form":
        return MaterialPageRoute(
            builder: (_) => Formulario()
        );
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Tela não encontrada"),
        ),
        body: Center(
          child: Text("Tela não encontrada"),
        ),
      );
    });
  }

}