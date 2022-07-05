import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/equipment_temperature/equipment_temperature.dart';

class EquipmentTemperatureRepository {
  Future<String> setHistory({required EquipmentTemperature equipment}) async {
    try {
      final firebase = FirebaseFirestore.instance
          .collection("equipamentos-temperatura")
          .doc();

      await firebase.set(equipment.toJson());
      return "OK";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Stream<List<EquipmentTemperature>> getEquipmentsHistory() {
    final firebase = FirebaseFirestore.instance
        .collection("equipamentos-temperatura")
        .snapshots();
    return firebase.map((snapshot) => snapshot.docs
        .map((doc) => EquipmentTemperature.fromJson(doc.data()))
        .toList());
  }
}
