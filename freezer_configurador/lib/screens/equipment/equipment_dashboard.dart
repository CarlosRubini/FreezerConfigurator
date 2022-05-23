import 'package:flutter/material.dart';

class EquipamentoDashboard extends StatelessWidget {
  const EquipamentoDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shadowColor: Colors.blue,
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                      child: const Text(
                        "Histórico de Temperatura",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 20, 5),
                    child: const Image(
                      image: AssetImage(
                          'assets/images/diagrama-de-mudanca-de-estado.png'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
