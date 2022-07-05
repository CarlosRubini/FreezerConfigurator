import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/configuration/configuration.dart';

class ConfigurationRepository {
  Future<String> setConfiguration(
      {required Configuration configuration}) async {
    try {
      final firebase = FirebaseFirestore.instance
          .collection("configuracao-geral")
          .doc("configuracao-geral");

      await firebase.set(configuration.toJson());
      return "OK";
    } on Exception catch (e) {
      return e.toString();
    }
  }

  Future<Configuration> getConfiguration() async {
    final firebase = FirebaseFirestore.instance
        .collection("configuracao-geral")
        .doc("configuracao-geral");
    final snapshot = await firebase.get();

    return Configuration.fromJson(snapshot.data()!);
  }
}
