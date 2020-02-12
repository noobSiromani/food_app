import 'package:flutter/material.dart';
import './colors.dart';

class MyAppBarWithoutTitle extends StatelessWidget implements PreferredSizeWidget {

  final Size pf = Size.fromHeight(120);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: pf.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[primaryTwo,primaryOne]
          )
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                      Icon(Icons.location_on, color: secondaryColor,),
                      Text("Durganagar, Kolkata - 65",style: TextStyle(color: secondaryColor),)
                    ],
                  ),
              ),
              Container(
                height: 50,
                width: 100,
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.shopping_cart,color: secondaryColor), 
                      onPressed: (){}),
                    IconButton(
                      icon: Icon(Icons.menu,color: secondaryColor,),
                      onPressed: (){
                      print("pressed");
                    })
                  ],
                ),
               ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 50,left: 50,top: 5),
            child: CustomTextField(),
          )
        ],
        ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => pf;
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  
  final Size pf = Size.fromHeight(200); 

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: pf.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[primaryTwo,primaryOne]
          )
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: Text(
              "Foodastic\nkitchen",
              style: TextStyle(
                fontSize: 20,
                color: secondaryColor
              ),
              ),
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                      Icon(Icons.location_on, color: secondaryColor,),
                      Text("Durganagar, Kolkata - 65",style: TextStyle(color: secondaryColor),)
                    ],
                  ),
              ),
              Container(
                height: 50,
                width: 50,
                child: IconButton(
                  icon: Icon(Icons.menu,color: secondaryColor,),
                  onPressed: (){
                    print("pressed");
                  },
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 50,left: 50,top: 5),
            child: CustomTextField(),
          )
        ],
        ),
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => pf;
}

class CustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
            child: TextField(
              cursorColor: primaryTwo,
              decoration: InputDecoration(
                filled: true,
                fillColor: secondaryColor,
                suffix: Icon(Icons.search,size: 20,),
                contentPadding: EdgeInsets.only(left: 20,right: 20,),
                hintText: "Search for a dish",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: BorderSide.none,
              )
            ),
          ),
      );
  }
}