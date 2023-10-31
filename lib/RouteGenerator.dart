import 'package:flutter/material.dart';
import 'package:projeto_simples_em_flutter/views/Formulario.dart';
import 'package:projeto_simples_em_flutter/views/Index.dart';
import 'package:projeto_simples_em_flutter/views/JokenPo.dart';
import 'package:projeto_simples_em_flutter/views/Pokedex.dart';
import 'package:projeto_simples_em_flutter/views/PokemonSearchPage.dart';

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
      case "/pokedex":
        return MaterialPageRoute(
            builder: (_) => Pokedex()
        );
      case "/searchpokemons":
        return MaterialPageRoute(
            builder: (_) => PokemonSearchPage()
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