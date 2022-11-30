import 'package:dio/dio.dart' hide Headers;
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'chargily_api.g.dart';

@RestApi(baseUrl: "https://epay.chargily.com.dz")
abstract class ChargilyApiClient {
  factory ChargilyApiClient(Dio dio, {String baseUrl}) = _ChargilyApiClient;

  @Headers(<String, dynamic>{"Accept": "application/json"})
  @POST("/api/invoice")
  Future<ChargilyResponse> createInvoice(
      @Header("X-Authorization") apiKey, Invoice invoice);
}

@JsonSerializable()
class ChargilyResponse {
  @JsonKey(name: "checkout_url")
  String? checkoutUrl;

  ChargilyResponse({this.checkoutUrl});
  factory ChargilyResponse.fromJson(Map<String, dynamic> json) =>
      _$ChargilyResponseFromJson(json);
}

@JsonSerializable()
class Invoice {
  String? client;
  @JsonKey(name: "client_email")
  String? clientEmail;
  @JsonKey(name: "invoice_number")
  String? invoiceNumber;
  double? discount;
  double? amount;
  @JsonKey(name: "back_url")
  String? backUrl;
  @JsonKey(name: "webhook_url")
  String? webhookUrl;
  PaymentMethod? mode;
  String? comment;

  Invoice(
      {this.client,
      this.clientEmail,
      this.amount,
      this.discount,
      this.backUrl,
      this.webhookUrl,
      this.mode,
      this.invoiceNumber,
      this.comment});

  factory Invoice.fromJson(Map<String, dynamic> json) =>
      _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}

enum PaymentMethod {
  @JsonValue('EDAHABIA')
  EDAHABIA,
  @JsonValue('CIB')
  CIB
}

@JsonSerializable()
class PaymentResponse {
  bool isSuccessful = false;
  dynamic body;

  PaymentResponse(this.isSuccessful, this.body);
}
