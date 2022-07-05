import 'package:flutter/material.dart';
import 'package:freezer_configurador/screens/equipment_form/equipment_edit_form.dart';

import '../helpers.dart';
import '../models/equipment/equipment.dart';
import '../repositories/equipment.dart';

class EquipamentosPage extends StatefulWidget {
  const EquipamentosPage({Key? key}) : super(key: key);

  @override
  _EquipamentosPageState createState() => _EquipamentosPageState();
}

class _EquipamentosPageState extends State<EquipamentosPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Equipment>>(
        stream: EquipmentRepository().getEquipments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Equipment>? equipments = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Equipamentos"),
              ),
              body: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView.builder(
                  itemCount: equipments!.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: Container(
                      height: 50,
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            equipments[index].name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () =>
                                  editarEquipamento(context, equipments[index]),
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () => deletarEquipamento(
                                  context, equipments[index]),
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    ));
                  },
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  void editarEquipamento(BuildContext context, Equipment equipment) {
    navigateTo(
        context,
        EquipamentoEdicao(
          equipment: equipment,
        ));
  }

  Future<void> deletarEquipamento(
      BuildContext context, Equipment equipment) async {
    final response =
        await EquipmentRepository().deleteEquipment(equipment: equipment);
    if (response == "OK") {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Equipamento excluido com sucesso!'),
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
