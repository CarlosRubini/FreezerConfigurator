import 'package:flutter/material.dart';

class EquipamentoBotoes extends StatelessWidget {
  const EquipamentoBotoes({Key? key}) : super(key: key);

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
                              onPressed: () => {},
                              child: const Icon(Icons.remove))),
                      const Padding(padding: EdgeInsets.all(5)),
                      Expanded(
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () => {},
                              child: const Icon(Icons.add))),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () => {},
                              child: const Text(
                                "Ligar",
                                style: TextStyle(fontSize: 20),
                              ))),
                    ],
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
