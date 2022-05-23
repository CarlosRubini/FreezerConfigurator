import 'package:flutter/material.dart';
import 'package:freezer_configurador/screens/equipment/equipment_buttons.dart';
import 'package:freezer_configurador/screens/equipment/equipment_dashboard.dart';
import 'package:freezer_configurador/screens/equipment/equipment_temperature.dart';

import 'equipment_info.dart';

class EquipamentoView extends StatelessWidget {
  const EquipamentoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
            child: Column(
          children: const [
            TemperaturaEquipamento(),
            EquipamentoInformacoes(),
            EquipamentoDashboard(),
            EquipamentoBotoes()
          ],
        )));
  }
}
