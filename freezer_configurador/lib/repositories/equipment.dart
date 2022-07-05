import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';

class EquipmentRepository {
  Future<String> setEquipment({required Equipment equipment}) async {
    try {
      final firebase = FirebaseFirestore.instance
          .collection("equipamentos")
          .doc(equipment.id.isEmpty ? null : equipment.id);
      if (equipment.id.isEmpty) equipment.id = firebase.id;

      await firebase.set(equipment.toJson());
      return "OK";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Stream<List<Equipment>> getEquipments() {
    final firebase =
        FirebaseFirestore.instance.collection("equipamentos").snapshots();
    return firebase.map((snapshot) =>
        snapshot.docs.map((doc) => Equipment.fromJson(doc.data())).toList());
  }

  Future<String> deleteEquipment({required Equipment equipment}) async {
    try {
      final firebase = FirebaseFirestore.instance
          .collection("equipamentos")
          .doc(equipment.id);

      await firebase.delete();
      return "OK";
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
