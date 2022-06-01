import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre"),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: const [
          Positioned(
              bottom: 10,
              child: Text(
                "Versão 1.0.0",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Positioned(
              bottom: 15,
              child: Image(
                height: 250,
                image: AssetImage('assets/images/BeCooler.png'),
              )),
          Positioned(
              top: 10,
              left: 20,
              child: Text(
                "Objetivo",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Positioned(
              left: 20,
              top: 35,
              right: 20,
              child: Text(
                  "O Aplicativo tem como objetivo o gerenciamento de freezers, cadastrando-os e administrando sua temperatura, informando a temperatura ideal e disponibilizando dados simultaneos do mesmo, tais como temperatura atual, tempo até temperatura ideal e um liga/desliga.",
                  softWrap: true,
                  style: TextStyle(fontSize: 15))),
          Positioned(
              top: 160,
              left: 20,
              child: Text(
                "Desenvolvido por:",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: 195,
              left: 20,
              child: Text(
                "Carlos Eduardo Rubini\nLucas dos Anjos\nGabriel Tomczak\nVinicius Demarchi",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
