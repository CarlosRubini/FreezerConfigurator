import 'package:flutter/material.dart';
import 'package:freezer_configurador/widgets/text_box.dart';

class ConfiguracaoGeralPage extends StatefulWidget {
  const ConfiguracaoGeralPage({Key? key}) : super(key: key);

  @override
  _ConfiguracaoGeralPageState createState() => _ConfiguracaoGeralPageState();
}

class _ConfiguracaoGeralPageState extends State<ConfiguracaoGeralPage> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Configurações Gerais"),
        ),
        body: Column(
          children: [
            Card(
                margin: const EdgeInsets.all(10),
                shadowColor: Colors.blue,
                borderOnForeground: true,
                child: SizedBox(
                  width: double.infinity,
                  height: 300,
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
                                    fontSize: 25, fontWeight: FontWeight.bold),
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
                              width: MediaQuery.of(context).size.width - 50,
                              controller: TextEditingController(),
                              hintText: 'Broker MQTT',
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
                              controller: TextEditingController(),
                              hintText: 'Porta',
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
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () => {},
                          child: const Text(
                            "Salvar",
                            style: TextStyle(fontSize: 20),
                          ))),
                ],
              ),
            )
          ],
        ));
  }
}
