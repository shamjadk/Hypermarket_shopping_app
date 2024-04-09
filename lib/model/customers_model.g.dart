// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomersModelImpl _$$CustomersModelImplFromJson(Map<String, dynamic> json) =>
    _$CustomersModelImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      profilePic: json['profilePic'] as String?,
      email: json['email'] as String?,
      street: json['street'] as String?,
      streetTwo: json['street_two'] as String?,
      pincode: json['pincode'] as int?,
      state: json['state'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$CustomersModelImplToJson(
        _$CustomersModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'mobile_number': instance.mobileNumber,
      'profilePic': instance.profilePic,
      'email': instance.email,
      'street': instance.street,
      'street_two': instance.streetTwo,
      'pincode': instance.pincode,
      'state': instance.state,
      'city': instance.city,
    };
