// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment_temperature.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EquipmentTemperature _$EquipmentTemperatureFromJson(
        Map<String, dynamic> json) =>
    EquipmentTemperature(
      json['id'] as String,
      json['temperature'] as int,
      DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$EquipmentTemperatureToJson(
        EquipmentTemperature instance) =>
    <String, dynamic>{
      'id': instance.id,
      'temperature': instance.temperature,
      'date': instance.date.toIso8601String(),
    };
