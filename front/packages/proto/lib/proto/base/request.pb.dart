///
//  Generated code. Do not modify.
//  source: base/request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'request.pbenum.dart';

export 'request.pbenum.dart';

class PWBRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PWBRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'base'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requestSeq', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<PWBToken>(99, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'authToken', subBuilder: PWBToken.create)
    ..a<$core.List<$core.int>>(100, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'requsetPayload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PWBRequest._() : super();
  factory PWBRequest({
    $fixnum.Int64? requestTime,
    $fixnum.Int64? requestSeq,
    PWBToken? authToken,
    $core.List<$core.int>? requsetPayload,
  }) {
    final _result = create();
    if (requestTime != null) {
      _result.requestTime = requestTime;
    }
    if (requestSeq != null) {
      _result.requestSeq = requestSeq;
    }
    if (authToken != null) {
      _result.authToken = authToken;
    }
    if (requsetPayload != null) {
      _result.requsetPayload = requsetPayload;
    }
    return _result;
  }
  factory PWBRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PWBRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PWBRequest clone() => PWBRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PWBRequest copyWith(void Function(PWBRequest) updates) => super.copyWith((message) => updates(message as PWBRequest)) as PWBRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PWBRequest create() => PWBRequest._();
  PWBRequest createEmptyInstance() => create();
  static $pb.PbList<PWBRequest> createRepeated() => $pb.PbList<PWBRequest>();
  @$core.pragma('dart2js:noInline')
  static PWBRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PWBRequest>(create);
  static PWBRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get requestTime => $_getI64(0);
  @$pb.TagNumber(1)
  set requestTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRequestTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestTime() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get requestSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set requestSeq($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRequestSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestSeq() => clearField(2);

  @$pb.TagNumber(99)
  PWBToken get authToken => $_getN(2);
  @$pb.TagNumber(99)
  set authToken(PWBToken v) { setField(99, v); }
  @$pb.TagNumber(99)
  $core.bool hasAuthToken() => $_has(2);
  @$pb.TagNumber(99)
  void clearAuthToken() => clearField(99);
  @$pb.TagNumber(99)
  PWBToken ensureAuthToken() => $_ensure(2);

  @$pb.TagNumber(100)
  $core.List<$core.int> get requsetPayload => $_getN(3);
  @$pb.TagNumber(100)
  set requsetPayload($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(100)
  $core.bool hasRequsetPayload() => $_has(3);
  @$pb.TagNumber(100)
  void clearRequsetPayload() => clearField(100);
}

class PWBResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PWBResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'base'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseTime', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responseSeq', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<PWBError>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transportError', subBuilder: PWBError.create)
    ..aOM<PWBError>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'businessError', subBuilder: PWBError.create)
    ..a<$core.List<$core.int>>(100, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'responsePayload', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  PWBResponse._() : super();
  factory PWBResponse({
    $fixnum.Int64? responseTime,
    $fixnum.Int64? responseSeq,
    PWBError? transportError,
    PWBError? businessError,
    $core.List<$core.int>? responsePayload,
  }) {
    final _result = create();
    if (responseTime != null) {
      _result.responseTime = responseTime;
    }
    if (responseSeq != null) {
      _result.responseSeq = responseSeq;
    }
    if (transportError != null) {
      _result.transportError = transportError;
    }
    if (businessError != null) {
      _result.businessError = businessError;
    }
    if (responsePayload != null) {
      _result.responsePayload = responsePayload;
    }
    return _result;
  }
  factory PWBResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PWBResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PWBResponse clone() => PWBResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PWBResponse copyWith(void Function(PWBResponse) updates) => super.copyWith((message) => updates(message as PWBResponse)) as PWBResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PWBResponse create() => PWBResponse._();
  PWBResponse createEmptyInstance() => create();
  static $pb.PbList<PWBResponse> createRepeated() => $pb.PbList<PWBResponse>();
  @$core.pragma('dart2js:noInline')
  static PWBResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PWBResponse>(create);
  static PWBResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get responseTime => $_getI64(0);
  @$pb.TagNumber(1)
  set responseTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasResponseTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseTime() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get responseSeq => $_getI64(1);
  @$pb.TagNumber(2)
  set responseSeq($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResponseSeq() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponseSeq() => clearField(2);

  @$pb.TagNumber(10)
  PWBError get transportError => $_getN(2);
  @$pb.TagNumber(10)
  set transportError(PWBError v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasTransportError() => $_has(2);
  @$pb.TagNumber(10)
  void clearTransportError() => clearField(10);
  @$pb.TagNumber(10)
  PWBError ensureTransportError() => $_ensure(2);

  @$pb.TagNumber(11)
  PWBError get businessError => $_getN(3);
  @$pb.TagNumber(11)
  set businessError(PWBError v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasBusinessError() => $_has(3);
  @$pb.TagNumber(11)
  void clearBusinessError() => clearField(11);
  @$pb.TagNumber(11)
  PWBError ensureBusinessError() => $_ensure(3);

  @$pb.TagNumber(100)
  $core.List<$core.int> get responsePayload => $_getN(4);
  @$pb.TagNumber(100)
  set responsePayload($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(100)
  $core.bool hasResponsePayload() => $_has(4);
  @$pb.TagNumber(100)
  void clearResponsePayload() => clearField(100);
}

class PWBError extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PWBError', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'base'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errCode', $pb.PbFieldType.OU3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'errMsg')
    ..hasRequiredFields = false
  ;

  PWBError._() : super();
  factory PWBError({
    $core.int? errCode,
    $core.String? errMsg,
  }) {
    final _result = create();
    if (errCode != null) {
      _result.errCode = errCode;
    }
    if (errMsg != null) {
      _result.errMsg = errMsg;
    }
    return _result;
  }
  factory PWBError.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PWBError.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PWBError clone() => PWBError()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PWBError copyWith(void Function(PWBError) updates) => super.copyWith((message) => updates(message as PWBError)) as PWBError; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PWBError create() => PWBError._();
  PWBError createEmptyInstance() => create();
  static $pb.PbList<PWBError> createRepeated() => $pb.PbList<PWBError>();
  @$core.pragma('dart2js:noInline')
  static PWBError getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PWBError>(create);
  static PWBError? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get errCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set errCode($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get errMsg => $_getSZ(1);
  @$pb.TagNumber(2)
  set errMsg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrMsg() => clearField(2);
}

class PWBToken extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PWBToken', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'base'), createEmptyInstance: create)
    ..e<PWBToken_TokenType>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: PWBToken_TokenType.Id, valueOf: PWBToken_TokenType.valueOf, enumValues: PWBToken_TokenType.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PWBToken._() : super();
  factory PWBToken({
    PWBToken_TokenType? type,
    $core.String? id,
  }) {
    final _result = create();
    if (type != null) {
      _result.type = type;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory PWBToken.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PWBToken.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PWBToken clone() => PWBToken()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PWBToken copyWith(void Function(PWBToken) updates) => super.copyWith((message) => updates(message as PWBToken)) as PWBToken; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PWBToken create() => PWBToken._();
  PWBToken createEmptyInstance() => create();
  static $pb.PbList<PWBToken> createRepeated() => $pb.PbList<PWBToken>();
  @$core.pragma('dart2js:noInline')
  static PWBToken getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PWBToken>(create);
  static PWBToken? _defaultInstance;

  @$pb.TagNumber(1)
  PWBToken_TokenType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(PWBToken_TokenType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get id => $_getSZ(1);
  @$pb.TagNumber(2)
  set id($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

