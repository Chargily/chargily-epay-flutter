// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chargily_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChargilyResponse _$ChargilyResponseFromJson(Map<String, dynamic> json) =>
    ChargilyResponse(
      checkoutUrl: json['checkout_url'] as String?,
    );

Map<String, dynamic> _$ChargilyResponseToJson(ChargilyResponse instance) =>
    <String, dynamic>{
      'checkout_url': instance.checkoutUrl,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      client: json['client'] as String?,
      clientEmail: json['client_email'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      backUrl: json['back_url'] as String?,
      webhookUrl: json['webhook_url'] as String?,
      mode: $enumDecodeNullable(_$PaymentMethodEnumMap, json['mode']),
      invoiceNumber: json['invoice_number'] as String?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'client': instance.client,
      'client_email': instance.clientEmail,
      'invoice_number': instance.invoiceNumber,
      'discount': instance.discount,
      'amount': instance.amount,
      'back_url': instance.backUrl,
      'webhook_url': instance.webhookUrl,
      'mode': _$PaymentMethodEnumMap[instance.mode],
      'comment': instance.comment,
    };

const _$PaymentMethodEnumMap = {
  PaymentMethod.EDAHABIA: 'EDAHABIA',
  PaymentMethod.CIB: 'CIB',
};

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) =>
    PaymentResponse(
      json['isSuccessful'] as bool,
      json['body'],
    );

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'isSuccessful': instance.isSuccessful,
      'body': instance.body,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ChargilyApiClient implements ChargilyApiClient {
  _ChargilyApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://epay.chargily.com.dz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChargilyResponse> createInvoice(
    apiKey,
    invoice,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Accept': 'application/json',
      r'X-Authorization': apiKey,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ChargilyResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/invoice',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ChargilyResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
