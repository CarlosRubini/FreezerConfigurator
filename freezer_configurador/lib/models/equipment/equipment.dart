import 'package:json_annotation/json_annotation.dart';

part 'equipment.g.dart';

@JsonSerializable()
class Equipment {
  late String id;
  late String name;
  late String mqttTopic;
  late int idealTemperature;
  late int temperature;
  late bool onOff;

  Equipment(this.id, this.name, this.mqttTopic, this.idealTemperature,
      this.temperature, this.onOff);

  factory Equipment.fromJson(Map<String, dynamic> json) =>
      _$EquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentToJson(this);
}
