import 'package:flutter/material.dart';

import '../../models/equipment/equipment.dart';

class TemperaturaEquipamento extends StatelessWidget {
  final Equipment equipment;
  const TemperaturaEquipamento({Key? key, required this.equipment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.all(10),
        shadowColor: Colors.blue,
        borderOnForeground: true,
        child: SizedBox(
          width: double.infinity,
          height: 75,
          child: Stack(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(15),
                  child: const Text(
                    "Temperatura Atual",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${equipment.temperature}ºC",
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
