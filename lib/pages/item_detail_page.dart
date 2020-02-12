import 'package:flutter/material.dart';
import '../colors.dart';
import '../custom_widgets.dart';

class ItemDetailViewer extends StatelessWidget {

  final int itemIndex;

  ItemDetailViewer(this.itemIndex);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar:MyAppBarWithoutTitle(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: <Color>[primaryOne,secondaryColor,secondaryColor],
                  stops: [0,0.8,1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: Hero(
                tag: "itemImage$itemIndex", 
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1000,
                  color: Colors.blue,
                  )
                ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [secondaryColor,secondaryColor,Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0,.2,1]
                ),
              ),
              )
              ),
            Align(
              child: FloatingActionButton(
                onPressed: (){},
                backgroundColor: secondaryColor,
                child: Icon(Icons.favorite,color: primaryOne,),
                ),
              alignment: Alignment(0.8,1),
            )
          ],
        ),

      ),
    );
  }
}
