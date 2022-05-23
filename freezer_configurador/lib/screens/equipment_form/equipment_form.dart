import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezer_configurador/widgets/text_box.dart';

class EquipamentoCadastro extends StatelessWidget {
  const EquipamentoCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
            child: Column(
          children: [
            Card(
                margin: const EdgeInsets.all(10),
                shadowColor: Colors.blue,
                borderOnForeground: true,
                child: SizedBox(
                  width: double.infinity,
                  height: 500,
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
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: TextBox(
                              width: MediaQuery.of(context).size.width - 50,
                              controller: TextEditingController(),
                              hintText: 'Nome do Dispositivo',
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
                              hintText: 'Tópico',
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
                              controller: TextEditingController(),
                              hintText: 'Temperatura Ideal',
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
        )));
  }
}
