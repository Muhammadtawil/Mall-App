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
}
