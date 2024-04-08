// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_api_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductApiState {
  List<Products>? get product => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductApiStateCopyWith<ProductApiState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductApiStateCopyWith<$Res> {
  factory $ProductApiStateCopyWith(
          ProductApiState value, $Res Function(ProductApiState) then) =
      _$ProductApiStateCopyWithImpl<$Res, ProductApiState>;
  @useResult
  $Res call({List<Products>? product, String? error});
}

/// @nodoc
class _$ProductApiStateCopyWithImpl<$Res, $Val extends ProductApiState>
    implements $ProductApiStateCopyWith<$Res> {
  _$ProductApiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Products>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductApiStateImplCopyWith<$Res>
    implements $ProductApiStateCopyWith<$Res> {
  factory _$$ProductApiStateImplCopyWith(_$ProductApiStateImpl value,
          $Res Function(_$ProductApiStateImpl) then) =
      __$$ProductApiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Products>? product, String? error});
}

/// @nodoc
class __$$ProductApiStateImplCopyWithImpl<$Res>
    extends _$ProductApiStateCopyWithImpl<$Res, _$ProductApiStateImpl>
    implements _$$ProductApiStateImplCopyWith<$Res> {
  __$$ProductApiStateImplCopyWithImpl(
      _$ProductApiStateImpl _value, $Res Function(_$ProductApiStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? error = freezed,
  }) {
    return _then(_$ProductApiStateImpl(
      product: freezed == product
          ? _value._product
          : product // ignore: cast_nullable_to_non_nullable
              as List<Products>?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProductApiStateImpl implements _ProductApiState {
  _$ProductApiStateImpl(
      {required final List<Products>? product, required this.error})
      : _product = product;

  final List<Products>? _product;
  @override
  List<Products>? get product {
    final value = _product;
    if (value == null) return null;
    if (_product is EqualUnmodifiableListView) return _product;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? error;

  @override
  String toString() {
    return 'ProductApiState(product: $product, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductApiStateImpl &&
            const DeepCollectionEquality().equals(other._product, _product) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_product), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductApiStateImplCopyWith<_$ProductApiStateImpl> get copyWith =>
      __$$ProductApiStateImplCopyWithImpl<_$ProductApiStateImpl>(
          this, _$identity);
}

abstract class _ProductApiState implements ProductApiState {
  factory _ProductApiState(
      {required final List<Products>? product,
      required final String? error}) = _$ProductApiStateImpl;

  @override
  List<Products>? get product;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$ProductApiStateImplCopyWith<_$ProductApiStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
