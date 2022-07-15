library chargily_epay_flutter;

import 'package:chargily_epay_flutter/validations.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'chargily_api.dart';

class Chargily {
  final String apiKey;
  ChargilyApiClient? apiClient = ChargilyApiClient(Dio());
  final Logger? logger;

  /// Chargily Payment Gateway Client
  ///
  /// Get `apiKey` from https://epay.chargily.com.dz/secure/admin/epay-api
  Chargily(this.apiKey, {this.logger, this.apiClient});

  /// Create Payment from `invoice`
  Future<PaymentResponse> createPayment(Invoice invoice) async {
    final validator = InvoiceValidator();

    final validations = validator.validate(invoice);
    if (validations.hasError) {
      logger?.e(validations.errors);
      return PaymentResponse(false, validations.errors);
    }
    final response = await apiClient?.createInvoice(apiKey, invoice);
    return PaymentResponse(true, response);
  }
}
