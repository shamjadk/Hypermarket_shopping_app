// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customers_model.freezed.dart';
part 'customers_model.g.dart';

@freezed
class CustomersModel with _$CustomersModel {
  const factory CustomersModel({
    required int? id,
    required String? name,
    @JsonKey(name: "mobile_number") required String? mobileNumber,
    required String? profilePic,
    required String? email,
    required String? street,
    @JsonKey(name: "street_two") required String? streetTwo,
    required int? pincode,
    required String? state,
    required String? city,
    required String? country,
  }) = _CustomersModel;

  factory CustomersModel.fromJson(Map<String, dynamic> json) =>
      _$CustomersModelFromJson(json);
}
