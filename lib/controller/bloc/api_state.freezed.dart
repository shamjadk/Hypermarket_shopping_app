// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiState {
  List<CustomerModel>? get customers => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiStateCopyWith<ApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiStateCopyWith<$Res> {
  factory $ApiStateCopyWith(ApiState value, $Res Function(ApiState) then) =
      _$ApiStateCopyWithImpl<$Res, ApiState>;
  @useResult
  $Res call({List<CustomerModel>? customers, String? error});
}

/// @nodoc
class _$ApiStateCopyWithImpl<$Res, $Val extends ApiState>
    implements $ApiStateCopyWith<$Res> {
  _$ApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      customers: freezed == customers
          ? _value.customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiStateImplCopyWith<$Res>
    implements $ApiStateCopyWith<$Res> {
  factory _$$ApiStateImplCopyWith(
          _$ApiStateImpl value, $Res Function(_$ApiStateImpl) then) =
      __$$ApiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CustomerModel>? customers, String? error});
}

/// @nodoc
class __$$ApiStateImplCopyWithImpl<$Res>
    extends _$ApiStateCopyWithImpl<$Res, _$ApiStateImpl>
    implements _$$ApiStateImplCopyWith<$Res> {
  __$$ApiStateImplCopyWithImpl(
      _$ApiStateImpl _value, $Res Function(_$ApiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customers = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ApiStateImpl(
      customers: freezed == customers
          ? _value._customers
          : customers // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ApiStateImpl implements _ApiState {
  _$ApiStateImpl(
      {required final List<CustomerModel>? customers, required this.error})
      : _customers = customers;

  final List<CustomerModel>? _customers;
  @override
  List<CustomerModel>? get customers {
    final value = _customers;
    if (value == null) return null;
    if (_customers is EqualUnmodifiableListView) return _customers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ApiState(customers: $customers, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiStateImpl &&
            const DeepCollectionEquality()
                .equals(other._customers, _customers) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_customers), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiStateImplCopyWith<_$ApiStateImpl> get copyWith =>
      __$$ApiStateImplCopyWithImpl<_$ApiStateImpl>(this, _$identity);
}

abstract class _ApiState implements ApiState {
  factory _ApiState(
      {required final List<CustomerModel>? customers,
      required final String? error}) = _$ApiStateImpl;

  @override
  List<CustomerModel>? get customers;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ApiStateImplCopyWith<_$ApiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
