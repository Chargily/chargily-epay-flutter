import 'package:fluent_validation/fluent_validation.dart';
import 'chargily_api.dart';

class InvoiceValidator extends AbstractValidator<Invoice> {
  InvoiceValidator() {
    ruleFor((invoice) => invoice.client, key: 'client').notEmpty().notNull();
    ruleFor((invoice) => invoice.clientEmail, key: 'client_email')
        .notNull()
        .isValidEmailAddress()
        .notEmpty();
    ruleFor((invoice) => invoice.amount, key: 'amount')
        .greaterThanOrEqual(75)
        .notNull();
    ruleFor((invoice) => invoice.discount, key: 'discount')
        .lessThan(100)
        .greaterThanOrEqual(0)
        .notNull();
    ruleFor((invoice) => invoice.webhookUrl, key: 'webhook_url')
        .notEmpty()
        .notNull();
    ruleFor((invoice) => invoice.webhookUrl, key: 'back_url')
        .notEmpty()
        .notNull();
    ruleFor((invoice) => invoice.invoiceNumber, key: 'invoice_number')
        .notEmpty()
        .notNull();
    ruleFor((invoice) => invoice.mode, key: 'mode')
        .must((dyn) => isEnum(dyn), 'Not a valid PaymentMethod')
        .notNull();
  }
}

bool isEnum(dynamic data) {
  if (data.runtimeType == "".runtimeType) {
    return false;
  }
  final split = data.toString().split('.');
  return split.length > 1 && split[0] == data.runtimeType.toString();
}
