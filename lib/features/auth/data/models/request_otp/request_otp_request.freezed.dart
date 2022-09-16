// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'request_otp_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestOtpRequest {
  String get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestOtpRequestCopyWith<RequestOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestOtpRequestCopyWith<$Res> {
  factory $RequestOtpRequestCopyWith(
          RequestOtpRequest value, $Res Function(RequestOtpRequest) then) =
      _$RequestOtpRequestCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class _$RequestOtpRequestCopyWithImpl<$Res>
    implements $RequestOtpRequestCopyWith<$Res> {
  _$RequestOtpRequestCopyWithImpl(this._value, this._then);

  final RequestOtpRequest _value;
  // ignore: unused_field
  final $Res Function(RequestOtpRequest) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_RequestOtpRequestCopyWith<$Res>
    implements $RequestOtpRequestCopyWith<$Res> {
  factory _$$_RequestOtpRequestCopyWith(_$_RequestOtpRequest value,
          $Res Function(_$_RequestOtpRequest) then) =
      __$$_RequestOtpRequestCopyWithImpl<$Res>;
  @override
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_RequestOtpRequestCopyWithImpl<$Res>
    extends _$RequestOtpRequestCopyWithImpl<$Res>
    implements _$$_RequestOtpRequestCopyWith<$Res> {
  __$$_RequestOtpRequestCopyWithImpl(
      _$_RequestOtpRequest _value, $Res Function(_$_RequestOtpRequest) _then)
      : super(_value, (v) => _then(v as _$_RequestOtpRequest));

  @override
  _$_RequestOtpRequest get _value => super._value as _$_RequestOtpRequest;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_RequestOtpRequest(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RequestOtpRequest implements _RequestOtpRequest {
  _$_RequestOtpRequest({required this.phoneNumber});

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'RequestOtpRequest(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RequestOtpRequest &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_RequestOtpRequestCopyWith<_$_RequestOtpRequest> get copyWith =>
      __$$_RequestOtpRequestCopyWithImpl<_$_RequestOtpRequest>(
          this, _$identity);
}

abstract class _RequestOtpRequest implements RequestOtpRequest {
  factory _RequestOtpRequest({required final String phoneNumber}) =
      _$_RequestOtpRequest;

  @override
  String get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_RequestOtpRequestCopyWith<_$_RequestOtpRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
