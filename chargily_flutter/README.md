# chargily-epay-flutter
Flutter Package for Chargily ePay Gateway

![Chargily ePay Gateway](https://raw.githubusercontent.com/Chargily/epay-gateway-php/main/assets/banner-1544x500.png "Chargily ePay Gateway")

This Plugin is to integrate ePayment gateway with Chargily easily.
- Currently support payment by **CIB / EDAHABIA** cards and soon by **Visa / Mastercard** 
- This repo is recently created for **Flutter Package**, If you are a developer and want to collaborate to the development of this package, you are welcomed!

# Installation:
Edit `pubspec.yaml` file to include [`chargily_flutter`](https://pub.dev/packages/chargily_flutter) package:
```yaml
dependencies:
  flutter:
    sdk: flutter
  chargily_flutter: any # <-- Add this
```
then run the command:
```powershell
flutter pub get
# or
dart pub get
```

# Usage:
```dart
import 'package:chargily_flutter/chargily.dart'

void main(List<String> args) async {
    final chargilyClient = Chargily('[API_KEY]');

    final invoice = Invoice(
        client: 'ahmed',
        clientEmail: 'rainxh11@gmail.com',
        amount: 1500,
        discount: 20.0,
        webhookUrl: 'http://webhookurl.com/',
        backUrl: 'http://backurl.com/',
        comment: 'Purchace',
        mode: PaymentMethod.CIB,
        invoiceNumber: '12345');

    final response = await chargilyClient.createPayment(invoice);
}
```