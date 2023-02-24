enum ItemType {
  cars,
  phone,
}

class SingleItem {
  String id;
  String name;
  String description;
  double price;
  int quantity;
  String imageUrl;

  SingleItem(
    this.id,
    this.name,
    this.description,
    this.price,
    this.quantity,
    this.imageUrl,
  );
}

class Cars extends SingleItem {
  String model;
  String color;
  Cars(this.color, this.model, String id, String name, String description,
      double price, int quantity, String imageUrl)
      : super(id, name, description, price, quantity, imageUrl);
}

class Phone extends SingleItem {
  String type;
  int ram;
  String camera;

  Phone(
    this.type,
    this.camera,
    this.ram,
    String id,
    String name,
    String description,
    double price,
    int quantity,
    String imageUrl,
  ) : super(
          id,
          name,
          description,
          price,
          quantity,
          imageUrl,
        );
}
