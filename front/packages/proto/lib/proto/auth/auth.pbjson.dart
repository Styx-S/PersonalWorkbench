///
//  Generated code. Do not modify.
//  source: auth/auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use loginReqDescriptor instead')
const LoginReq$json = const {
  '1': 'LoginReq',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'password', '17': true},
  ],
  '8': const [
    const {'1': '_name'},
    const {'1': '_password'},
  ],
};

/// Descriptor for `LoginReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReqDescriptor = $convert.base64Decode('CghMb2dpblJlcRIXCgRuYW1lGAEgASgJSABSBG5hbWWIAQESHwoIcGFzc3dvcmQYAiABKAlIAVIIcGFzc3dvcmSIAQFCBwoFX25hbWVCCwoJX3Bhc3N3b3Jk');
@$core.Deprecated('Use loginRspDescriptor instead')
const LoginRsp$json = const {
  '1': 'LoginRsp',
  '2': const [
    const {'1': 'token', '3': 2, '4': 1, '5': 11, '6': '.base.PWBToken', '9': 0, '10': 'token', '17': true},
  ],
  '8': const [
    const {'1': '_token'},
  ],
};

/// Descriptor for `LoginRsp`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRspDescriptor = $convert.base64Decode('CghMb2dpblJzcBIpCgV0b2tlbhgCIAEoCzIOLmJhc2UuUFdCVG9rZW5IAFIFdG9rZW6IAQFCCAoGX3Rva2Vu');
