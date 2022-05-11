import 'package:flutter/material.dart';
import 'package:freezer_configurador/screens/equipment/equipment_temperature.dart';

class EquipamentoView extends StatelessWidget {
  const EquipamentoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: Column(
          children: const [TemperaturaEquipamento()],
        ));
  }
}
