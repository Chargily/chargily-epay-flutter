library chargily_flutter;

import 'package:chargily_flutter/invoice_validator.dart';
import 'package:dio/dio.dart';

import 'chargily_api.dart';

class Chargily {
  String apiKey;
  ChargilyApiClient? apiClient;

  Chargily(this.apiKey) {
    apiClient = ChargilyApiClient(Dio());
  }

  Future<PaymentResponse> createPayment(Invoice invoice) async {
    final validator = InvoiceValidator();

    final validations = validator.validate(invoice);
    if (validations.hasError) {
      return PaymentResponse(false, validations.errors);
    }
    final response = await apiClient?.createInvoice(apiKey, invoice);
    return PaymentResponse(true, response);
  }
}
