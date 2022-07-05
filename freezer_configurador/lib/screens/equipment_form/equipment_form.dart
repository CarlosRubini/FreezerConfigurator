import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:freezer_configurador/repositories/equipment.dart';
import 'package:freezer_configurador/widgets/text_box.dart';

class EquipamentoCadastro extends StatefulWidget {
  const EquipamentoCadastro({Key? key}) : super(key: key);

  @override
  _EquipamentoCadastroState createState() => _EquipamentoCadastroState();
}

class _EquipamentoCadastroState extends State<EquipamentoCadastro> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mqttTopicController = TextEditingController();
  TextEditingController idealTemperatureController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                                  child: const Text(
                                    "Novo Equipamento",
                                    style: TextStyle(
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
                                  width: MediaQuery.of(context).size.width - 50,
                                  controller: nameController,
                                  hintText: 'Nome do Dispositivo',
                                  validator: (String? value) => validate(value),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topCenter,
                                child: TextBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  controller: mqttTopicController,
                                  hintText: 'Tópico MQTT',
                                  validator: (String? value) => validate(value),
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
                                  width: MediaQuery.of(context).size.width - 50,
                                  controller: idealTemperatureController,
                                  hintText: 'Temperatura Ideal',
                                  validator: (String? value) => validate(value),
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
            ))));
  }

  String? validate(String? value) {
    return value!.isEmpty ? "Campo Obrigatório" : null;
  }

  void setEquipment() async {
    if (formKey.currentState!.validate()) {
      final response = await EquipmentRepository().setEquipment(
          equipment: Equipment(
              "",
              nameController.text,
              mqttTopicController.text,
              int.parse(idealTemperatureController.text),
              0,
              true));
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
