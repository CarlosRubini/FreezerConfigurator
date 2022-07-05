import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:freezer_configurador/repositories/equipment_temperature_history.dart';
import 'package:freezer_configurador/screens/equipment/equipment_buttons.dart';
import 'package:freezer_configurador/screens/equipment/equipment_dashboard.dart';
import 'package:freezer_configurador/screens/equipment/equipment_temperature.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

import '../../models/equipment_temperature/equipment_temperature.dart';
import '../../repositories/equipment.dart';
import 'equipment_info.dart';

class EquipamentoView extends StatefulWidget {
  final Equipment equipment;
  const EquipamentoView({Key? key, required this.equipment}) : super(key: key);

  @override
  _EquipamentoViewState createState() =>
      // ignore: no_logic_in_create_state
      _EquipamentoViewState(equipment: equipment);
}

class _EquipamentoViewState extends State<EquipamentoView> {
  final Equipment equipment;
  String? clientIdentifier;
  MqttConnectionState? connectionState;
  StreamSubscription? subscription;
  MqttServerClient client =
      MqttServerClient("broker.hivemq.com", "configurador");

  _EquipamentoViewState({required this.equipment});

  @override
  void initState() {
    super.initState();
    clientIdentifier = "configurador";
    WidgetsBinding.instance.addPostFrameCallback((_) {
      connectMqtt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
            child: Column(
          children: [
            TemperaturaEquipamento(equipment: equipment),
            EquipamentoInformacoes(equipment: equipment),
            EquipamentoDashboard(equipment: equipment),
            EquipamentoBotoes(equipment: equipment, client: client)
          ],
        )));
  }

  void subscribeToTopic(String topic) {
    if (connectionState == MqttConnectionState.connected) {
      client.subscribe("appcaduteste1234", MqttQos.exactlyOnce);
    }
  }

  void disconnect() {
    client.disconnect();
    onDisconnected();
  }

  void onDisconnected() {
    setState(() async {
      connectionState = client.connectionStatus!.state;
      if (subscription != null) await subscription!.cancel();
      subscription = null;
    });
  }

  Future<void> onMessage(List<MqttReceivedMessage> event) async {
    final MqttPublishMessage recMess = event[0].payload;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
    equipment.temperature = int.parse(message);
    EquipmentRepository().setEquipment(equipment: equipment);
    EquipmentTemperatureRepository().setHistory(
        equipment: EquipmentTemperature(
            equipment.id, equipment.temperature, DateTime.now()));
    publishOnOffMessage();
  }

  void publishOnOffMessage() {
    MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    if (equipment.temperature >= equipment.idealTemperature) {
      builder.addString("L");
      equipment.onOff = true;
    } else {
      builder.addString("D");
      equipment.onOff = false;
    }

    client.publishMessage(
        "appcaduteste123liga", MqttQos.exactlyOnce, builder.payload!,
        retain: true);
    EquipmentRepository().setEquipment(equipment: equipment);
  }

  void connectMqtt() async {
    client.port = 1883;
    client.keepAlivePeriod = 30;
    client.onDisconnected = onDisconnected;
    client.logging(on: true);

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(clientIdentifier.toString())
        .startClean()
        .withWillQos(MqttQos.atMostOnce);

    client.connectionMessage = connMess;
    try {
      await client.connect("gCSNDyNMo9dw9ETuKpYM");
    } catch (e) {
      disconnect();
    }

    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      setState(() {
        connectionState = client.connectionStatus!.state;
      });
    }

    subscription = client.updates!.listen(onMessage);
    subscribeToTopic("appcaduteste1234");
  }
}
