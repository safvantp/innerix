// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      user_id: (json['user_id'] as num).toInt(),
      email: json['email'] as String,
      phone_number: json['phone_number'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'name': instance.name,
    };
