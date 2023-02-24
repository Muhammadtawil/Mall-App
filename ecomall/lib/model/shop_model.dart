// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';

class Shop {
  final String id;
  final String name;
  final String logoUrl;
  final String description;
  final List items;
  final String imageUrl;
  final String location;
  final double rate;
  final String categoryType;
  final String ownerName;
  final String ownerIdImage;
  final int follwersCount;
  final int viewersCount;
  final int branchesCount;
  final double profit;
  final int itemsSelled;
  bool isclose;
  bool isBoosted;
  bool isHaveStore;

  Shop(
    this.id,
    this.name,
    this.logoUrl,
    this.description,
    this.items,
    this.imageUrl,
    this.location,
    this.rate,
    this.categoryType,
    this.ownerName,
    this.ownerIdImage,
    this.follwersCount,
    this.viewersCount,
    this.branchesCount,
    this.profit,
    this.itemsSelled,
    this.isclose,
    this.isBoosted,
    this.isHaveStore,
  );

  Shop copyWith({
    String? id,
    String? name,
    String? logoUrl,
    String? description,
    List? items,
    String? imageUrl,
    String? location,
    double? rate,
    String? categoryType,
    String? ownerName,
    String? ownerIdImage,
    int? follwersCount,
    int? viewersCount,
    int? branchesCount,
    double? profit,
    int? itemsSelled,
    bool? isclose,
    bool? isBoosted,
    bool? isHaveStore,
  }) {
    return Shop(
      id ?? this.id,
      name ?? this.name,
      logoUrl ?? this.logoUrl,
      description ?? this.description,
      items ?? this.items,
      imageUrl ?? this.imageUrl,
      location ?? this.location,
      rate ?? this.rate,
      categoryType ?? this.categoryType,
      ownerName ?? this.ownerName,
      ownerIdImage ?? this.ownerIdImage,
      follwersCount ?? this.follwersCount,
      viewersCount ?? this.viewersCount,
      branchesCount ?? this.branchesCount,
      profit ?? this.profit,
      itemsSelled ?? this.itemsSelled,
      isclose ?? this.isclose,
      isBoosted ?? this.isBoosted,
      isHaveStore ?? this.isHaveStore,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'logoUrl': logoUrl,
      'description': description,
      'items': items,
      'imageUrl': imageUrl,
      'location': location,
      'rate': rate,
      'categoryType': categoryType,
      'ownerName': ownerName,
      'ownerIdImage': ownerIdImage,
      'follwersCount': follwersCount,
      'viewersCount': viewersCount,
      'branchesCount': branchesCount,
      'profit': profit,
      'itemsSelled': itemsSelled,
      'isclose': isclose,
      'isBoosted': isBoosted,
      'isHaveStore': isHaveStore,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      map['id'] as String,
      map['name'] as String,
      map['logoUrl'] as String,
      map['description'] as String,
      List.from((map['items'] as List)),
      map['imageUrl'] as String,
      map['location'] as String,
      map['rate'] as double,
      map['categoryType'] as String,
      map['ownerName'] as String,
      map['ownerIdImage'] as String,
      map['follwersCount'] as int,
      map['viewersCount'] as int,
      map['branchesCount'] as int,
      map['profit'] as double,
      map['itemsSelled'] as int,
      map['isclose'] as bool,
      map['isBoosted'] as bool,
      map['isHaveStore'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shop(id: $id, name: $name, logoUrl: $logoUrl, description: $description, items: $items, imageUrl: $imageUrl, location: $location, rate: $rate, categoryType: $categoryType, ownerName: $ownerName, ownerIdImage: $ownerIdImage, follwersCount: $follwersCount, viewersCount: $viewersCount, branchesCount: $branchesCount, profit: $profit, itemsSelled: $itemsSelled, isclose: $isclose, isBoosted: $isBoosted, isHaveStore: $isHaveStore,),';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.name == name &&
        other.logoUrl == logoUrl &&
        other.description == description &&
        listEquals(other.items, items) &&
        other.imageUrl == imageUrl &&
        other.location == location &&
        other.rate == rate &&
        other.categoryType == categoryType &&
        other.ownerName == ownerName &&
        other.ownerIdImage == ownerIdImage &&
        other.follwersCount == follwersCount &&
        other.viewersCount == viewersCount &&
        other.branchesCount == branchesCount &&
        other.profit == profit &&
        other.itemsSelled == itemsSelled &&
        other.isclose == isclose &&
        other.isBoosted == isBoosted &&
        other.isHaveStore == isHaveStore;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        logoUrl.hashCode ^
        description.hashCode ^
        items.hashCode ^
        imageUrl.hashCode ^
        location.hashCode ^
        rate.hashCode ^
        categoryType.hashCode ^
        ownerName.hashCode ^
        ownerIdImage.hashCode ^
        follwersCount.hashCode ^
        viewersCount.hashCode ^
        branchesCount.hashCode ^
        profit.hashCode ^
        itemsSelled.hashCode ^
        isclose.hashCode ^
        isBoosted.hashCode ^
        isHaveStore.hashCode;
  }
}
