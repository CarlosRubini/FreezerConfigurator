// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Equipment _$EquipmentFromJson(Map<String, dynamic> json) => Equipment(
      json['id'] as String,
      json['name'] as String,
      json['mqttTopic'] as String,
      json['idealTemperature'] as int,
      json['temperature'] as int,
      json['onOff'] as bool,
    );

Map<String, dynamic> _$EquipmentToJson(Equipment instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mqttTopic': instance.mqttTopic,
      'idealTemperature': instance.idealTemperature,
      'temperature': instance.temperature,
      'onOff': instance.onOff,
    };
