import 'package:flutter/material.dart';

import '../../models/equipment/equipment.dart';

class EquipamentoInformacoes extends StatelessWidget {
  final Equipment equipment;
  const EquipamentoInformacoes({Key? key, required this.equipment})
      : super(key: key);

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
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(15, 10, 5, 5),
                  child: Text(
                    "Temperatura Ideal: ${equipment.idealTemperature}°C",
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  )),
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
