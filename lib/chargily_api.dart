import 'package:retrofit/retrofit.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart' hide Headers;

part 'chargily_api.g.dart';

@RestApi(baseUrl: "https://epay.chargily.com.dz")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @Headers(<String, dynamic>{"Accept": "application/json"})
  @POST("/api/invoice")
  Future<dynamic> createInvoice(
      @Header("X-Authorization") apiKey, Invoice invoice);
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

class ChargilyResponse {
  @JsonKey(name: "checkout_url")
  String? checkoutUrl;
}

enum PaymentMethod {
  @JsonValue('EDAHABIA')
  EDAHABIA,
  @JsonValue('CIB')
  CIB
}
