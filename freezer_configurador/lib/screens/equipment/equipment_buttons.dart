import 'package:flutter/material.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../repositories/equipment.dart';

class EquipamentoBotoes extends StatelessWidget {
  final Equipment equipment;
  final MqttServerClient client;
  const EquipamentoBotoes(
      {Key? key, required this.equipment, required this.client})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue),
                              onPressed: () =>
                                  publishMqttMessage(MessageType.remove),
                              child: const Icon(Icons.remove))),
                      const Padding(padding: EdgeInsets.all(5)),
                      Expanded(
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () =>
                                  publishMqttMessage(MessageType.add),
                              child: const Icon(Icons.add))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: equipment.onOff
                                      ? Colors.red
                                      : Colors.green),
                              onPressed: () => publishMqttOnOffMessage(),
                              child: Text(
                                equipment.onOff ? "Desligar" : "Ligar",
                                style: const TextStyle(fontSize: 20),
                              ))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }

  void publishMqttMessage(MessageType type) {
    if (type == MessageType.add) {
      equipment.idealTemperature++;
    } else {
      equipment.idealTemperature--;
    }

    MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(equipment.idealTemperature.toString());

    client.publishMessage(
        "appcaduteste123", MqttQos.exactlyOnce, builder.payload!,
        retain: true);
    EquipmentRepository().setEquipment(equipment: equipment);
  }

  void publishMqttOnOffMessage() {
    MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(equipment.onOff ? "D" : "L");
    equipment.onOff = !equipment.onOff;

    client.publishMessage(
        "appcaduteste123liga", MqttQos.exactlyOnce, builder.payload!,
        retain: true);
    EquipmentRepository().setEquipment(equipment: equipment);
  }
}

enum MessageType { remove, add }
