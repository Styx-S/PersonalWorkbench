///
//  Generated code. Do not modify.
//  source: base/request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PWBToken_TokenType extends $pb.ProtobufEnum {
  static const PWBToken_TokenType Id = PWBToken_TokenType._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'Id');

  static const $core.List<PWBToken_TokenType> values = <PWBToken_TokenType> [
    Id,
  ];

  static final $core.Map<$core.int, PWBToken_TokenType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PWBToken_TokenType? valueOf($core.int value) => _byValue[value];

  const PWBToken_TokenType._($core.int v, $core.String n) : super(v, n);
}

