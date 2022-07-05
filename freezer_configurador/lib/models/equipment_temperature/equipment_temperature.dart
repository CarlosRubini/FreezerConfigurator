import 'package:json_annotation/json_annotation.dart';

part 'equipment_temperature.g.dart';

@JsonSerializable()
class EquipmentTemperature {
  final String id;
  final int temperature;
  final DateTime date;

  EquipmentTemperature(this.id, this.temperature, this.date);

  factory EquipmentTemperature.fromJson(Map<String, dynamic> json) =>
      _$EquipmentTemperatureFromJson(json);
  Map<String, dynamic> toJson() => _$EquipmentTemperatureToJson(this);
}
