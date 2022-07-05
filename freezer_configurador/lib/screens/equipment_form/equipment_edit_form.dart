import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:freezer_configurador/repositories/equipment.dart';
import 'package:freezer_configurador/widgets/text_box.dart';

class EquipamentoEdicao extends StatefulWidget {
  final Equipment equipment;
  const EquipamentoEdicao({Key? key, required this.equipment})
      : super(key: key);

  @override
  _EquipamentoEdicaoState createState() =>
      // ignore: no_logic_in_create_state
      _EquipamentoEdicaoState(equipment: equipment);
}

class _EquipamentoEdicaoState extends State<EquipamentoEdicao> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mqttTopicController = TextEditingController();
  TextEditingController idealTemperatureController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Equipment equipment;

  _EquipamentoEdicaoState({required this.equipment});

  @override
  Widget build(BuildContext context) {
    nameController.text = equipment.name;
    mqttTopicController.text = equipment.mqttTopic;
    idealTemperatureController.text = equipment.idealTemperature.toString();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Edição Equipamento"),
        ),
        body: Form(
            key: formKey,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey[300],
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Card(
                        margin: const EdgeInsets.all(10),
                        shadowColor: Colors.blue,
                        borderOnForeground: true,
                        child: SizedBox(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.all(20),
                                      child: Text(
                                        equipment.name,
                                        style: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Container(
                                      alignment: Alignment.topRight,
                                      margin: const EdgeInsets.all(20),
                                      child: const Icon(
                                        Icons.build_rounded,
                                        size: 30,
                                      )),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: TextBox(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      controller: nameController,
                                      hintText: 'Nome do Dispositivo',
                                      validator: (String? value) =>
                                          validate(value),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: TextBox(
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      controller: mqttTopicController,
                                      hintText: 'Tópico MQTT',
                                      validator: (String? value) =>
                                          validate(value),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topCenter,
                                    child: TextBox(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      width: MediaQuery.of(context).size.width -
                                          50,
                                      controller: idealTemperatureController,
                                      hintText: 'Temperatura Ideal',
                                      validator: (String? value) =>
                                          validate(value),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  onPressed: () => setEquipment(),
                                  child: const Text(
                                    "Salvar",
                                    style: TextStyle(fontSize: 20),
                                  ))),
                        ],
                      ),
                    )
                  ],
                )))));
  }

  String? validate(String? value) {
    return value!.isEmpty ? "Campo Obrigatório" : null;
  }

  void setEquipment() async {
    if (formKey.currentState!.validate()) {
      equipment.name = nameController.text;
      equipment.mqttTopic = mqttTopicController.text;
      equipment.idealTemperature = int.parse(idealTemperatureController.text);

      final response =
          await EquipmentRepository().setEquipment(equipment: equipment);
      if (response == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Equipamento salvo com sucesso!'),
          backgroundColor: Colors.green,
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(response),
          backgroundColor: Colors.red,
        ));
      }
    }
  }
}
