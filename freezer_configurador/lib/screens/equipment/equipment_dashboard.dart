import 'package:flutter/material.dart';
import 'package:freezer_configurador/models/equipment_temperature/equipment_temperature.dart';
import 'package:freezer_configurador/repositories/equipment.dart';
import 'package:freezer_configurador/repositories/equipment_temperature_history.dart';
import '../../models/equipment/equipment.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EquipamentoDashboard extends StatefulWidget {
  final Equipment equipment;
  const EquipamentoDashboard({Key? key, required this.equipment})
      : super(key: key);

  @override
  _EquipamentoDashboardState createState() =>
      // ignore: no_logic_in_create_state
      _EquipamentoDashboardState(equipment: equipment);
}

class _EquipamentoDashboardState extends State<EquipamentoDashboard> {
  final Equipment equipment;
  late List<EquipmentTemperature>? temperatures;

  _EquipamentoDashboardState({required this.equipment});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EquipmentTemperature>>(
        stream: EquipmentTemperatureRepository().getEquipmentsHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            temperatures = snapshot.data!
                .where((data) => data.date
                    .isAfter(DateTime.now().add(const Duration(minutes: -10))))
                .toList();
            return Card(
                margin: const EdgeInsets.all(10),
                shadowColor: Colors.blue,
                borderOnForeground: true,
                child: SizedBox(
                  width: double.infinity,
                  height: 340,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SafeArea(
                            child: SfCartesianChart(
                              margin: const EdgeInsets.all(10),
                              title: ChartTitle(
                                  text: "Histórico Temperatura",
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                              legend: Legend(
                                  isVisible: true,
                                  position: LegendPosition.bottom),
                              primaryXAxis: NumericAxis(
                                  edgeLabelPlacement: EdgeLabelPlacement.shift),
                              series: <ChartSeries>[
                                LineSeries<EquipmentTemperature, int>(
                                    name: "Temperatura",
                                    dataSource: temperatures!,
                                    xValueMapper:
                                        (EquipmentTemperature temp, _) =>
                                            temperatures!.indexOf(temp),
                                    yValueMapper:
                                        (EquipmentTemperature temp, _) =>
                                            temp.temperature)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
