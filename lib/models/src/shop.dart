class Shop {
  final String? description;
  final String? moneyFormat;
  final String? name;
  final PaymentSettings? paymentSettings;
  final PrimaryDomain? primaryDomain;
  final PrivacyPolicy? privacyPolicy;
  final RefundPolicy? refundPolicy;
  final List<String>? shipsToCountries;
  final TermsOfService? termsOfService;

  Shop({this.description, this.moneyFormat, this.name, this.paymentSettings, this.primaryDomain, this.privacyPolicy, this.refundPolicy, this.shipsToCountries, this.termsOfService});

  static Shop fromJson(Map<String, dynamic>? json){
    final shop = json?['shop'] ?? const {};
    return Shop(
      description: shop['description'],
      moneyFormat: shop['moneyFormat'],
      name: shop['name'],
      paymentSettings: PaymentSettings.fromJson(shop['paymentSettings'] ?? const {}),
      primaryDomain: PrimaryDomain.fromJson(shop['primaryDomain'] ?? const {}),
      privacyPolicy: PrivacyPolicy.fromJson(shop['privacyPolicy'] ?? const {}),
      refundPolicy: RefundPolicy.fromJson(shop['refundPolicy'] ?? const {}),
      shipsToCountries: _getShipsToCountryList(shop),
      termsOfService: TermsOfService.fromJson(shop['termsOfService'] ?? const {}),
    );
  }

  static _getShipsToCountryList(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['shipsToCountries'].forEach((shipString) => stringList.add(shipString));
    return stringList;
  }
}

class PaymentSettings {
  final List<String>? acceptedCardBrands;
  final String? cardVaultUrl;
  final String? countryCode;
  final String? currencyCode;
  final List<String>? enabledPresentmentCurrencies;
  final String? shopifyPaymentAccountId;
  final List<String>? supportedDigitalWallets;

  PaymentSettings(
      {this.acceptedCardBrands, this.cardVaultUrl, this.countryCode, this.currencyCode, this.enabledPresentmentCurrencies, this.shopifyPaymentAccountId, this.supportedDigitalWallets});

  static PaymentSettings fromJson(Map<String, dynamic> json) {
    return PaymentSettings(
        acceptedCardBrands: _getAcceptedCardBrands(json),
        cardVaultUrl: json['cardVaultUrl'],
        countryCode: json['countryCode'],
        currencyCode: json['currencyCode'],
        enabledPresentmentCurrencies: _getEnabledPresentmentCurrencies(json),
        shopifyPaymentAccountId: json['shopifyPaymentAccountId'],
        supportedDigitalWallets: _getSupportedDigitalWallets(json)
    );
  }

  static _getAcceptedCardBrands(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['acceptedCardBrands'].forEach((e) => stringList.add(e));
    return stringList;
  }

  static _getEnabledPresentmentCurrencies(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['enabledPresentmentCurrencies'].forEach((e) => stringList.add(e));
    return stringList;
  }

  static _getSupportedDigitalWallets(Map<String, dynamic> json) {
    List<String> stringList = [];
    json['supportedDigitalWallets'].forEach((e) => stringList.add(e));
    return stringList;
  }
}

class PrimaryDomain {
  final String? host;
  final bool? sslEnabled;
  final String? url;

  PrimaryDomain({this.host, this.sslEnabled, this.url});

  static PrimaryDomain fromJson(Map<String, dynamic> json){
    return PrimaryDomain(
        host: json['host'] ?? const {},
        sslEnabled: json['sslEnabled'] ?? const {},
        url: json['url'] ?? const {}
    );
  }
}

class PrivacyPolicy {
  final String? body;
  final String? handle;
  final String? id;
  final String? title;
  final String? url;

  PrivacyPolicy({this.body, this.handle, this.id, this.title, this.url});

  static PrivacyPolicy fromJson(Map<String, dynamic> json){
    return PrivacyPolicy(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']
    );
  }
}

class RefundPolicy {
  final String? body;
  final String? handle;
  final String? id;
  final String? title;
  final String? url;

  RefundPolicy({this.body, this.handle, this.id, this.title, this.url});

  static RefundPolicy fromJson(Map<String, dynamic> json){
    return RefundPolicy(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']
    );
  }
}

class TermsOfService {
  final String? body;
  final String? handle;
  final String? id;
  final String? title;
  final String? url;

  TermsOfService({this.body, this.handle, this.id, this.title, this.url});

  static TermsOfService fromJson(Map<String, dynamic> json){
    return TermsOfService(
        body: json['body'],
        handle: json['handle'],
        id: json['id'],
        title: json['title'],
        url: json['url']
    );
  }
}