import 'package:aviz/core/constants/app_strings.dart';

class AdvertsModel {
  final int? page;
  final int? perPage;
  final int? totalItems;
  final int? totalPages;
  final List<Advert>? items;

  AdvertsModel({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  factory AdvertsModel.fromJson(Map<String, dynamic> json) {
    var itemList = json['items'] as List?;
    List<Advert>? advertisements;
    if (itemList != null) {
      advertisements = itemList.map((item) => Advert.fromJson(item)).toList();
    }

    return AdvertsModel(
      page: json['page'],
      perPage: json['perPage'],
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
      items: advertisements,
    );
  }
}

class Advert {
  final String? baseImage;
  final String? collectionId;
  final String? collectionName;
  final String? created;
  final String? description;
  final String? id;
  final int? price;
  final String? title;
  final String? updated;
  final bool? isHot;
  final bool? isVerified;

  Advert({
    this.baseImage,
    this.collectionId,
    this.collectionName,
    this.created,
    this.description,
    this.id,
    this.price,
    this.title,
    this.updated,
    this.isHot,
    this.isVerified,
  });

  factory Advert.fromJson(Map<String, dynamic> json) {
    return Advert(
      baseImage:
          '${AppStrings.baseUrl}files/${json['collectionId']}/${json['id']}/${json['baseImage']}',
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      description: json['description'],
      id: json['id'],
      price: json['price'],
      title: json['title'],
      updated: json['updated'],
      isHot: json['isHot'],
      isVerified: json['isVerified'],
    );
  }
}
