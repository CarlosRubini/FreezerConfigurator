import 'package:flutter/material.dart';

class EquipamentoInformacoes extends StatelessWidget {
  const EquipamentoInformacoes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shadowColor: Colors.blue,
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 80,
          child: Stack(
            children: [
              Column(children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                    child: const Text(
                      "Temperatura Ideal: -6°C",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.fromLTRB(15, 5, 0, 10),
                    child: const Text(
                      "Tempo restante: 15min",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
              ]),
              Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.fromLTRB(0, 10, 20, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Image(
                        height: 60,
                        image: AssetImage('assets/images/celsius.png'),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
