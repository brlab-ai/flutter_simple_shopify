import 'package:flutter_simple_shopify/models/src/order.dart';
import 'package:flutter_simple_shopify/models/src/product.dart';

class Checkout{
  final String? id;
  final String? email;
  final List<AppliedGiftCards>? appliedGiftcards;
  final AvailableShippingRates? availableShippingrates;
  final ShippingRates? shippingLine;
  final MailingAddress? shippingAddress;
  final String? completedAt;
  final String? createdAt;
  final String? currencyCode;
  final LineItems? lineItems;
  final String? note;
  final String? webUrl;
  final String? updatedAt;
  final PriceV2? totalTaxV2;
  final PriceV2? totalPriceV2;
  final bool? taxesIncluded;
  final bool? taxExempt;
  final PriceV2? subtotalPriceV2;
  final String? orderStatusUrl;
  final bool? requiresShipping;
  final Order? order;

  Checkout({this.id, this.email, this.appliedGiftcards,
    this.availableShippingrates, this.shippingLine,this.shippingAddress, this.completedAt, this.createdAt,
    this.currencyCode, this.lineItems, this.note, this.webUrl, this.updatedAt,
    this.totalTaxV2, this.totalPriceV2, this.taxesIncluded, this.taxExempt,
    this.subtotalPriceV2, this.orderStatusUrl, this.requiresShipping, this.order});


  static Checkout fromJson(Map<String, dynamic> json){
    return Checkout(
        id: json['id'],
        email: json['email'],
        appliedGiftcards: _getAppliedGiftCards(json/* ?? const {}*/),
        availableShippingrates: AvailableShippingRates.fromJson(json['availableShippingRates'] ?? const {}),
        shippingLine: ShippingRates.fromJson(json['shippingLine'] ?? const {}),
        shippingAddress: MailingAddress.fromJson(json['shippingAddress'] ?? const {}),
        completedAt: json['completedAt'],
        createdAt: json['createdAt'],
        currencyCode: json['currencyCode'],
        lineItems: LineItems.fromJson(json['lineItems']),
        note: json['note'],
        webUrl: json['webUrl'],
        updatedAt: json['updatedAt'],
        totalTaxV2: PriceV2.fromJson(json['totalTaxV2'] ?? const {}),
        totalPriceV2: PriceV2.fromJson(json['totalPriceV2'] ?? const {}),
        taxesIncluded: json['taxesIncluded'],
        taxExempt: json['taxExempt'],
        subtotalPriceV2: PriceV2.fromJson(json['subtotalPriceV2'] ?? const {}),
        orderStatusUrl: json['orderStatusUrl'],
        requiresShipping: json['requiresShipping'],
        order: Order.fromJson(json['order'] ?? const {}),
    );
  }

  static List<AppliedGiftCards> _getAppliedGiftCards(Map<String, dynamic> json) {
    List<AppliedGiftCards> appliedGiftCardsList = [];
    json['appliedGiftCards']?.forEach((e) => appliedGiftCardsList.add(AppliedGiftCards.fromJson(e ?? const {})));
    return appliedGiftCardsList;
  }



}



class AvailableShippingRates {
  final bool? ready;
  final List<ShippingRates>? shippingRates;


  const AvailableShippingRates({this.ready, this.shippingRates});

  static AvailableShippingRates fromJson(Map<String, dynamic> json){
    return AvailableShippingRates(
      ready: json['ready'],
      shippingRates: _getShippingRates(json/* ?? const {}*/),
    );
  }
  static List<ShippingRates> _getShippingRates(Map<String, dynamic> json) {
    List<ShippingRates> shippingRatesList = [];
    json['shippingRates']?.forEach((e) => shippingRatesList.add(ShippingRates.fromJson(e ?? const {})));
    return shippingRatesList;
  }

}



class ShippingRates {
  final String? handle;
  final String? title;
  final PriceV2? priceV2;

  ShippingRates({this.handle, this.title, this.priceV2});

  static ShippingRates fromJson(Map<String, dynamic> json){
    return ShippingRates(
        handle: json['handle'],
        title: json['title'],
        priceV2: PriceV2.fromJson(json['priceV2'] ?? const {})
    );
  }
}
class MailingAddress {
  final String? address1;
  final String? address2;
  final String? city;
  final String? company;
  final String? country;
  final String? countryCodeV2;
  final String? firstName;
  final String? formattedArea;
  final String? id;
  final String? lastName;
  final double? latitude;
  final double? longitude;
  final String? name;
  final String? phone;
  final String? province;
  final String? provinceCode;
  final String? zip;

  MailingAddress({this.address1, this.address2, this.city,this.company, this.country, this.countryCodeV2,this.firstName, this.formattedArea, this.id,this.lastName, this.latitude, this.longitude, this.name, this.phone, this.province, this.provinceCode, this.zip});

  static MailingAddress fromJson(Map<String, dynamic> json){
    return MailingAddress(
        address1: json['address1'],
        address2: json['address2'],
        city: json['city'],
        company: json['company'],
        country: json['country'],
        countryCodeV2: json['countryCodeV2'],
        firstName: json['firstName'],
        formattedArea: json['formattedArea'],
        id: json['id'],
        lastName: json['lastName'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        name: json['name'],
        phone: json['phone'],
        province: json['province'],
        provinceCode: json['provinceCode'],
        zip: json['zip'],
    );
  }
}
class LineItems{
  final List<LineItem>? lineItemList;

  LineItems({this.lineItemList});

  static LineItems fromJson(Map<String, dynamic> json){
    return LineItems(
        lineItemList: _getLineItemList(json)
    );
  }
  static List<LineItem> _getLineItemList(Map<String, dynamic> json){
    List<LineItem> lineItemList = [];
    json['edges']?.forEach((lineItem) => lineItemList.add(LineItem.fromJson(lineItem ?? const {})));
    return lineItemList;
  }
}

class LineItem {
  final String? id;
  final int? quantity;
  final String? title;
  final ProductVariantCheckout? variant;

  LineItem({this.id, this.quantity, this.variant, this.title});

  static LineItem fromJson(Map<String, dynamic> json){
    return LineItem(
      id: (json['node'] ?? const {})['id'],
      quantity: (json['node'] ?? const {})['quantity'],
      variant: ProductVariantCheckout.fromJson(((json['node'] ?? const {})['variant'] ?? const{})),
      title: (json['node'] ?? const {})['title'],
    );
  }
}

class ProductVariantCheckout {
  final PriceV2? price;
  final String? title;
  final ShopifyImage? image;
  final PriceV2? compareAtPrice;
  final double? weight;
  final String? weightUnit;
  final bool? availableForSale;
  final String? sku;
  final bool? requiresShipping;
  final String? id;

  const ProductVariantCheckout(
      {this.price,
        this.title,
        this.image,
        this.compareAtPrice,
        this.weight,
        this.weightUnit,
        this.availableForSale,
        this.sku,
        this.requiresShipping,
        this.id});

  static ProductVariantCheckout fromJson(Map<String, dynamic> json) {
    return ProductVariantCheckout(
      price:
      PriceV2.fromJson(json['priceV2'] ?? const {}),
      title: json['title'],
      image: ShopifyImage.fromJson(json['image'] ?? const {}),
      compareAtPrice: PriceV2.fromJson(
          json['compareAtPriceV2'] ?? const {} ),
      weight: json['weight'] ,
      weightUnit: json['weightUnit'],
      availableForSale: json['availableForSale'] ,
      sku: json['sku'] ,
      requiresShipping: json['requiresShipping'],
      id: json['id'] ,
    );
  }
}

class AppliedGiftCards {

  final PriceV2? amountUsedV2;
  final PriceV2? balanceV2;
  final String? id;

  AppliedGiftCards({this.amountUsedV2, this.balanceV2, this.id});

  static AppliedGiftCards fromJson(Map<String, dynamic> json){
    return AppliedGiftCards(
        amountUsedV2: PriceV2.fromJson(json['amountUsedV2'] ?? const {}),
        balanceV2: PriceV2.fromJson(json['balanceV2'] ?? const {}),
        id: json['id']
    );
  }
}
