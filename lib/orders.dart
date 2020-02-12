import './items.dart';

class Orders {
  static final List<Order> _ordersList = [];
  static final Orders _orders = new Orders._internal();

  factory Orders(){
    return _orders;
  }

  Orders._internal();

  void addOrder(Order orderGiven) {
    bool added = false;
    for(Order order in Orders._ordersList){
      if(order.itemName == orderGiven.itemName && order.type.typeName == orderGiven.type.typeName){
        order.itemCount++;
        added = true;
      }
    }
    if(!added){
      Orders._ordersList.add(orderGiven);
    }
  }

  void deleteOrder(Order orderToDelete){
    bool exist = false;
    for(Order order in Orders._ordersList){
      if(order.itemName == orderToDelete.itemName && order.type.typeName == orderToDelete.type.typeName  && order.itemCount >0){
        exist = true;
        order.itemCount--;
        if(order.itemCount <= 0){
          Orders._ordersList.remove(order);
        }
      }
    }
    if(!exist){
      //throw exception
    }
  }

  void showOrders(){
    for(Order order in Orders._ordersList){
      print("itemName:${order.itemName},price: ${order.type.price},count:${order.itemCount}");
    }
  }
}



class Order {
  String itemName;
  int itemCount;
  Type type;
  String image;
  Order({this.itemName,this.itemCount = 1,this.type,this.image});
}