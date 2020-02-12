class Item {
  Item({this.name,this.image,this.rating,this.types});
   String name;
   String image;
   double rating;
   List<Type> types;
}

class Type {
  Type({this.typeName,this.price});
  String typeName;
  double price;
}

List<Item> riceCatagory() {
  return [
    Item(name: 'Veg rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Chilli Garlic rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Singapore rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Hongkong rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Triple rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Paneer rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    Item(name: 'Born garlic rice',rating: 4.5,types: [Type(typeName: 'veg',price: 40),Type(typeName: 'egg',price: 50),Type(typeName: 'chicken',price: 60),Type(typeName: 'egg-chicken',price: 70)]),
    ];
}