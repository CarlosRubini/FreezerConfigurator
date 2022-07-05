import 'package:flutter/material.dart';
import 'package:freezer_configurador/models/configuration/configuration.dart';
import 'package:freezer_configurador/widgets/text_box.dart';

import '../repositories/configuration.dart';

class ConfiguracaoGeralPage extends StatefulWidget {
  const ConfiguracaoGeralPage({Key? key}) : super(key: key);

  @override
  _ConfiguracaoGeralPageState createState() => _ConfiguracaoGeralPageState();
}

class _ConfiguracaoGeralPageState extends State<ConfiguracaoGeralPage> {
  bool isSwitched = true;
  TextEditingController brokerController = TextEditingController();
  TextEditingController portaController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Configurações Gerais"),
        ),
        body: FutureBuilder<Configuration?>(
          future: ConfigurationRepository().getConfiguration(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final Configuration configuration =
                  snapshot.data as Configuration;
              brokerController.text = configuration.broker;
              portaController.text = configuration.porta.toString();
              return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Card(
                          margin: const EdgeInsets.all(10),
                          shadowColor: Colors.blue,
                          borderOnForeground: true,
                          child: SizedBox(
                            width: double.infinity,
                            height: 350,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin: const EdgeInsets.all(20),
                                        child: const Text(
                                          "Configurações Gerais",
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.all(20),
                                        child: Text("Habilitar Notificações",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        setState(() {
                                          isSwitched = value;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.topCenter,
                                      child: TextBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        controller: brokerController,
                                        hintText: 'Broker MQTT',
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
                                        width:
                                            MediaQuery.of(context).size.width -
                                                50,
                                        controller: portaController,
                                        hintText: 'Porta',
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
                                    onPressed: () => setConfiguration(),
                                    child: const Text(
                                      "Salvar",
                                      style: TextStyle(fontSize: 20),
                                    ))),
                          ],
                        ),
                      )
                    ],
                  ));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  void setConfiguration() async {
    if (formKey.currentState!.validate()) {
      final response = await ConfigurationRepository().setConfiguration(
          configuration: Configuration(
              brokerController.text, int.parse(portaController.text)));
      if (response == "OK") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Configuração salva com sucesso!'),
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

  String? validate(String? value) {
    return value!.isEmpty ? "Campo Obrigatório" : null;
  }
}
