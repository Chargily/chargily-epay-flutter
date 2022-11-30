# chargily_epay_flutter

Flutter Package for Chargily ePay Gateway

![Chargily ePay Gateway](https://raw.githubusercontent.com/Chargily/epay-gateway-php/main/assets/banner-1544x500.png "Chargily ePay Gateway")

This Plugin is to integrate ePayment gateway with Chargily easily.

- Currently support payment by **CIB / EDAHABIA** cards and soon by **Visa / Mastercard**

# Installation:

#### Using `flutter` CLI:

```powershell
flutter pub add chargily_epay_flutter
```

#### **Or by editing pubspec.yaml:**

Edit `pubspec.yaml` file to include [`chargily_epay_flutter`](https://pub.dev/packages/chargily_epay_flutter) package:

```yaml
flutter:
  sdk: flutter
chargily_epay_flutter: any # <-- Add this
```

then run the command:

```powershell
flutter pub get
# or
dart pub get
```

# Usage:

```dart
import 'package:chargily_epay_flutter/chargily.dart'

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

## Note for who will be using the source code itself instead of the `pub.dev` package:

this library uses `retrofit` to generate REST API Client, if you encounter any bug building the source, try regenerating the API Client with this command:

```powershell
flutter pub run build_runner build --delete-conflicting-outputs
```
