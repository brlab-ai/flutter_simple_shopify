import 'package:flutter_simple_shopify/models/src/product.dart';

class Collections {
  final List<Collection> collectionList;
  final bool? hasNextPage;

  Collections({this.collectionList = const [], this.hasNextPage});

  static Collections fromJson(Map<String, dynamic> json) {
    return Collections(
        collectionList: _getCollectionList(json/* ?? const {}*/),
        hasNextPage: (json['pageInfo'] ?? const {})['hasNextPage']);
  }

  static List<Collection> _getCollectionList(Map<String, dynamic> json) {
    List<Collection> collectionList = [];
    json['edges']?.forEach(
        (e) => collectionList.add(Collection.fromJson(e ?? const {})));
    return collectionList;
  }
}

class Collection {
  final String? title;
  final String? description;
  final String? descriptionHtml;
  final String? handle;
  final String? id;
  final String? updatedAt;
  final ShopifyImage? image;
  final Products? products;
  final String? cursor;

  Collection(
      {this.title,
      this.description,
      this.descriptionHtml,
      this.handle,
      this.id,
      this.updatedAt,
      this.image,
      this.products,
      this.cursor});

  static Collection fromJson(Map<String, dynamic>? json) {
    final node = json?['node']??const {};
    return Collection(
      title: (node)['title'],
      description: (node)['description'],
      descriptionHtml: (node)['descriptionHtml'],
      handle: (node)['handle'],
      id: (node)['id'],
      updatedAt: (node)['updatedAt'],
      image: ShopifyImage.fromJson(
          (node)['image'] ?? const {}),
      products:
          Products.fromJson((node)['products'] ?? const {}),
      cursor: json?['cursor'],
    );
  }
}
