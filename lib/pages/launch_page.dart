import 'package:flutter/material.dart';
import 'package:food_app/pages/item_detail_page.dart';
import '../colors.dart';
import '../items.dart';
import '../orders.dart';
import '../custom_widgets.dart';

Orders orders = new Orders();

int maxOrderCount = 2;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: MyAppBar(),
      body: MyAppBody(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.shopping_cart),onPressed: (){},),
    );
  }
}

class MyAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ListView(
        semanticChildCount: 2,
        children: <Widget>[
          CustomVerticalScrollMenu(),
          CustomTabMenu()
        ],
      ),
    );
  }
}

class CustomTabMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomTabMenuState();
  }
}

class CustomTabMenuState extends State<CustomTabMenu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: secondaryColor,
      padding: EdgeInsets.only(right: 25,left: 25),
      child: DefaultTabController(
          length: 7,
          child: Column(
            children: <Widget>[
              TabBar(
                labelColor: primaryTwo,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: "Rice",),
                  Tab(text: "Biryanis",),
                  Tab(text: "Noodles",),
                  Tab(text: "Fish items",),
                  Tab(text: "Chicken items",),
                  Tab(text: "Non-veg Combos",),
                  Tab(text: "veg Combos",),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: TabBarView(
                  children: <Widget>[
                    CustomItemList(itemList: riceCatagory()),
                    Icon(Icons.security),
                    Icon(Icons.security),
                    Icon(Icons.security),
                    Icon(Icons.security),
                    Icon(Icons.security),
                    Icon(Icons.security),
                  ],
                ),
              )
              
            ],
            ) 
        ),
      );
  }
}

class InitialAddToCartButton extends StatefulWidget {
  final Order order;
  InitialAddToCartButton(this.order);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InitialAddToCartButtonState(order);
  }
}

class InitialAddToCartButtonState extends State<InitialAddToCartButton> 
with AutomaticKeepAliveClientMixin {
  Order order;
  int ordercount = 0;
  Widget _addButton;
  InitialAddToCartButtonState(this.order);
  @override
  void initState() {
    // TODO: implement initState
    _addButton = Container(
      width: 60,
      alignment: Alignment.center,
      child: Icon(Icons.add_circle,color: primaryTwo),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: _addButton,
      ),
      onTap: (){
        ordercount ++;
        orders.addOrder(order);
        orders.showOrders();
        if(ordercount > 0){
          setState(() {
            _addButton = OrderCounter(order);
          });
        }else{
          _addButton = Container(
            width: 60,
            alignment: Alignment.center,
            child: Icon(Icons.add_circle,color: primaryTwo),
          );
        }
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CustomItemList extends StatefulWidget {
  final List<Item> itemList;
  CustomItemList({this.itemList});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomItemListState(itemList:this.itemList);
  }
}

class CustomItemListState extends State<CustomItemList> {

  List<Item> itemList; 

  CustomItemListState({this.itemList});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ItemDetailViewer(index)));
            },
            leading: Container(
              padding: EdgeInsets.all(5),
              height: MediaQuery.of(context).size.height,
              child: Hero(tag: 'itemImage$index', child: CircleAvatar(backgroundColor: Colors.blue,)),
            ),
            title: Container(
              //alignment: Alignment.center,
                child: Text(itemList[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                ),
              ),
            subtitle: Container(
              child: Row(
                children: <Widget>[
                  Text(itemList[index].rating.toString()),
                  Icon(Icons.star,
                    color: primaryOne,
                    size: 15,
                  ),
                  Container(width: 20,),
                  Text('Price:')
                ],
              ),
            ),
            trailing: InitialAddToCartButton(Order(itemName: itemList[index].name,type: itemList[index].types[0]))
          );
        },
      ),
    );
  }

}

class OrderCounter extends StatefulWidget {

  final Order order;

  OrderCounter(this.order);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderCounterState(this.order);
  }
}

class OrderCounterState extends State<OrderCounter>{
  Order order;
  OrderCounterState(this.order);
  int orderCounter = 1; 
  Widget addButton;
  var firstTime = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if(firstTime){
    addButton = Container(
        width: 60,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: primaryTwo,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.remove,
                size: 15,
                color: secondaryColor,
              ),
            Text(orderCounter.toString(),
              style: TextStyle(
                color: secondaryColor
              ),
            ),
            Icon(Icons.add,
                size: 15,
                color: secondaryColor,
              )
        ],
      ),
    );
  }
    
    // TODO: implement build
    return GestureDetector(
      onTapDown: (details){
        RenderBox getBox = context.findRenderObject();
        var local = getBox.globalToLocal(details.globalPosition);
        if(local.dx <20 && local.dx >0){
          print("-");
          if(orderCounter > 0){
            orders.deleteOrder(order);
            orders.showOrders();
            setState(() {
              orderCounter --;
              if(orderCounter <= 0){
                setState(() {
                  firstTime = false;
                  print("object");
                  addButton = InitialAddToCartButton(order);
                });
              }
            });
          }
        }else if(local.dx >40 && local.dx < 60){
          print("+");
          if(orderCounter < maxOrderCount){
            orders.addOrder(order);
            orders.showOrders();
            setState(() {
              orderCounter ++;
            });
          }
        }
      },
      child: addButton,
    );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Container(
        alignment: Alignment.center,
        width: 200,
        child: Text("data"),
      ),
    );
  }
}

class CustomVerticalScrollMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[primaryOne,secondaryColor,secondaryColor],
                stops: [0,0.8,1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: ListView(
              padding: EdgeInsets.all(25),
              semanticChildCount: 5,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                CustomCard(),CustomCard(),CustomCard(),CustomCard(),CustomCard(),
              ],
              ),
          );
  }
}