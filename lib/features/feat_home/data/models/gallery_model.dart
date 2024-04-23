class GalleryModel {
  final int? page;
  final int? perPage;
  final int? totalItems;
  final int? totalPages;
  final List<Gallery>? items;

  GalleryModel({
    this.page,
    this.perPage,
    this.totalItems,
    this.totalPages,
    this.items,
  });

  factory GalleryModel.fromJson(Map<String, dynamic> json) {
    var itemList = json['items'] as List?;
    List<Gallery>? galleries;
    if (itemList != null) {
      galleries = itemList.map((item) => Gallery.fromJson(item)).toList();
    }

    return GalleryModel(
      page: json['page'],
      perPage: json['perPage'],
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
      items: galleries,
    );
  }
}

class Gallery {
  final String? advertId;
  final String? collectionId;
  final String? collectionName;
  final String? created;
  final String? id;
  final String? image;
  final String? updated;

  Gallery({
    this.advertId,
    this.collectionId,
    this.collectionName,
    this.created,
    this.id,
    this.image,
    this.updated,
  });

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      advertId: json['advert_id'],
      collectionId: json['collectionId'],
      collectionName: json['collectionName'],
      created: json['created'],
      id: json['id'],
      image: json['image'],
      updated: json['updated'],
    );
  }
}
