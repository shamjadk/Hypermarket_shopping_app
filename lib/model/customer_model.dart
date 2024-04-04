// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'customer_model.g.dart';
part 'customer_model.freezed.dart';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

@freezed
class Customer with _$Customer {
    const factory Customer({
        @JsonKey(name: "error_code")
        required int errorCode,
        @JsonKey(name: "data")
        required List<Datum> data,
        @JsonKey(name: "message")
        required String message,
    }) = _Customer;

    factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "profile_pic")
        required String? profilePic,
        @JsonKey(name: "mobile_number")
        required String mobileNumber,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "street")
        required String street,
        @JsonKey(name: "street_two")
        required String streetTwo,
        @JsonKey(name: "city")
        required String city,
        @JsonKey(name: "pincode")
        required int pincode,
        @JsonKey(name: "country")
        required String country,
        @JsonKey(name: "state")
        required String state,
        @JsonKey(name: "created_date")
        required DateTime createdDate,
        @JsonKey(name: "created_time")
        required String createdTime,
        @JsonKey(name: "modified_date")
        required DateTime modifiedDate,
        @JsonKey(name: "modified_time")
        required String modifiedTime,
        @JsonKey(name: "flag")
        required bool flag,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
