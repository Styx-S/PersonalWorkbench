///
//  Generated code. Do not modify.
//  source: base/request.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pWBRequestDescriptor instead')
const PWBRequest$json = const {
  '1': 'PWBRequest',
  '2': const [
    const {'1': 'request_time', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'requestTime', '17': true},
    const {'1': 'request_seq', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'requestSeq', '17': true},
    const {'1': 'auth_token', '3': 99, '4': 1, '5': 11, '6': '.base.PWBToken', '9': 2, '10': 'authToken', '17': true},
    const {'1': 'requset_payload', '3': 100, '4': 1, '5': 12, '9': 3, '10': 'requsetPayload', '17': true},
  ],
  '8': const [
    const {'1': '_request_time'},
    const {'1': '_request_seq'},
    const {'1': '_auth_token'},
    const {'1': '_requset_payload'},
  ],
};

/// Descriptor for `PWBRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pWBRequestDescriptor = $convert.base64Decode('CgpQV0JSZXF1ZXN0EiYKDHJlcXVlc3RfdGltZRgBIAEoBEgAUgtyZXF1ZXN0VGltZYgBARIkCgtyZXF1ZXN0X3NlcRgCIAEoBEgBUgpyZXF1ZXN0U2VxiAEBEjIKCmF1dGhfdG9rZW4YYyABKAsyDi5iYXNlLlBXQlRva2VuSAJSCWF1dGhUb2tlbogBARIsCg9yZXF1c2V0X3BheWxvYWQYZCABKAxIA1IOcmVxdXNldFBheWxvYWSIAQFCDwoNX3JlcXVlc3RfdGltZUIOCgxfcmVxdWVzdF9zZXFCDQoLX2F1dGhfdG9rZW5CEgoQX3JlcXVzZXRfcGF5bG9hZA==');
@$core.Deprecated('Use pWBResponseDescriptor instead')
const PWBResponse$json = const {
  '1': 'PWBResponse',
  '2': const [
    const {'1': 'response_time', '3': 1, '4': 1, '5': 4, '9': 0, '10': 'responseTime', '17': true},
    const {'1': 'response_seq', '3': 2, '4': 1, '5': 4, '9': 1, '10': 'responseSeq', '17': true},
    const {'1': 'transport_error', '3': 10, '4': 1, '5': 11, '6': '.base.PWBError', '9': 2, '10': 'transportError', '17': true},
    const {'1': 'business_error', '3': 11, '4': 1, '5': 11, '6': '.base.PWBError', '9': 3, '10': 'businessError', '17': true},
    const {'1': 'response_payload', '3': 100, '4': 1, '5': 12, '9': 4, '10': 'responsePayload', '17': true},
  ],
  '8': const [
    const {'1': '_response_time'},
    const {'1': '_response_seq'},
    const {'1': '_transport_error'},
    const {'1': '_business_error'},
    const {'1': '_response_payload'},
  ],
};

/// Descriptor for `PWBResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pWBResponseDescriptor = $convert.base64Decode('CgtQV0JSZXNwb25zZRIoCg1yZXNwb25zZV90aW1lGAEgASgESABSDHJlc3BvbnNlVGltZYgBARImCgxyZXNwb25zZV9zZXEYAiABKARIAVILcmVzcG9uc2VTZXGIAQESPAoPdHJhbnNwb3J0X2Vycm9yGAogASgLMg4uYmFzZS5QV0JFcnJvckgCUg50cmFuc3BvcnRFcnJvcogBARI6Cg5idXNpbmVzc19lcnJvchgLIAEoCzIOLmJhc2UuUFdCRXJyb3JIA1INYnVzaW5lc3NFcnJvcogBARIuChByZXNwb25zZV9wYXlsb2FkGGQgASgMSARSD3Jlc3BvbnNlUGF5bG9hZIgBAUIQCg5fcmVzcG9uc2VfdGltZUIPCg1fcmVzcG9uc2Vfc2VxQhIKEF90cmFuc3BvcnRfZXJyb3JCEQoPX2J1c2luZXNzX2Vycm9yQhMKEV9yZXNwb25zZV9wYXlsb2Fk');
@$core.Deprecated('Use pWBErrorDescriptor instead')
const PWBError$json = const {
  '1': 'PWBError',
  '2': const [
    const {'1': 'err_code', '3': 1, '4': 1, '5': 13, '9': 0, '10': 'errCode', '17': true},
    const {'1': 'err_msg', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'errMsg', '17': true},
  ],
  '8': const [
    const {'1': '_err_code'},
    const {'1': '_err_msg'},
  ],
};

/// Descriptor for `PWBError`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pWBErrorDescriptor = $convert.base64Decode('CghQV0JFcnJvchIeCghlcnJfY29kZRgBIAEoDUgAUgdlcnJDb2RliAEBEhwKB2Vycl9tc2cYAiABKAlIAVIGZXJyTXNniAEBQgsKCV9lcnJfY29kZUIKCghfZXJyX21zZw==');
@$core.Deprecated('Use pWBTokenDescriptor instead')
const PWBToken$json = const {
  '1': 'PWBToken',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.base.PWBToken.TokenType', '9': 0, '10': 'type', '17': true},
    const {'1': 'id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'id', '17': true},
  ],
  '4': const [PWBToken_TokenType$json],
  '8': const [
    const {'1': '_type'},
    const {'1': '_id'},
  ],
};

@$core.Deprecated('Use pWBTokenDescriptor instead')
const PWBToken_TokenType$json = const {
  '1': 'TokenType',
  '2': const [
    const {'1': 'Id', '2': 0},
  ],
};

/// Descriptor for `PWBToken`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pWBTokenDescriptor = $convert.base64Decode('CghQV0JUb2tlbhIxCgR0eXBlGAEgASgOMhguYmFzZS5QV0JUb2tlbi5Ub2tlblR5cGVIAFIEdHlwZYgBARITCgJpZBgCIAEoCUgBUgJpZIgBASITCglUb2tlblR5cGUSBgoCSWQQAEIHCgVfdHlwZUIFCgNfaWQ=');
