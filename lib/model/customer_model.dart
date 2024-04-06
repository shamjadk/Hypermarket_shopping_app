// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_model.g.dart';
part 'customer_model.freezed.dart';

@freezed
class CustomerModel with _$CustomerModel {
  const factory CustomerModel({
   required int id,
        required String? name,
        required String? profilePic,
        required String? street,
        required String? state,
        required String? city,
  }) = _CustomerModel;

factory CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);
}
