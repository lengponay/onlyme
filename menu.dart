import 'package:flutter/material.dart';
import 'package:western/widgets/itemsWidget.dart';
import 'package:western/widgets/itemsWidget2.dart';
import 'package:western/widgets/itemsWidget3.dart';
import 'package:western/widgets/itemsWidget4.dart';
import 'package:western/widgets/itemsWidget5.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Icon : Icons.grid_4x4_rounded,
      length : 5,
      child: Scaffold(
        backgroundColor : Color.fromARGB(255, 94, 134, 143),
       body :SafeArea(
          child: Padding(
            padding: EdgeInsets.only(),
            child : Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal : 15),
                  child : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children : [
                    //ទី១ (Icon)
                      InkWell(
                        onTap : (){
                          Navigator.pushNamed(context, "/home");
                        },
                        child : Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color : Colors.white,
                          size : 32,
      
                        ),
                      ),
                      Text(
                        "Menu",
                        style : TextStyle(
                          fontSize : 28,
                          color : Colors.white,
                          fontWeight : FontWeight.bold,
                        ),
                      ),
                    //ទី ២ (Icon)
                      InkWell(
                        onTap : (){
                          Navigator.pushNamed(context,"/cart");
                        },
                        child : Icon(
                          Icons.shopping_cart_checkout_rounded,
                          color : Colors.white,
                          size : 35,
                  
                        ),
                      ),
                      
                    ],
                  ),
                ),

                //description 1 
                SizedBox(
                  height : 15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time, // Use the desired icon here
                        color: Colors.white,
                        size: 20, // Adjust the size as needed
                      ),
                      SizedBox(width: 10), // Adds some space between the icon and the text
                      Text(
                        "Open from 7AM Until 5PM",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                //description 2 
                SizedBox(height : 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.directions_walk, // Use the desired icon here
                        color: Colors.white,
                        size: 20, // Adjust the size as needed
                      ),
                      SizedBox(width: 10), // Adds some space between the icon and the text
                      Text(
                        "Self-PickUp at the LU Coffee",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),

                //description 3
                SizedBox(height : 4),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star_rate_outlined, // Use the desired icon here
                        color: Colors.white,
                        size: 20, // Adjust the size as needed
                      ),
                      SizedBox(width: 10), // Adds some space between the icon and the text
                      Text(
                        "9.5    100+ ratings",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 102, 52, 52),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height : 8,),
                TabBar(
                  isScrollable : true,
                  indicator : BoxDecoration(
                   
                  ),
                  labelStyle: TextStyle(
                    fontSize : 20,
                    color : Colors.white,
                    fontWeight : FontWeight.bold,

                  ),
                  labelPadding : EdgeInsets.symmetric(horizontal : 20),
                  tabs : [
                    Tab(text : "Iced Coffee"),
                    Tab(text : "Hot Coffee"),
                    Tab(text : "Tea"),
                    Tab(text : "Milk Tea"),
                    Tab(text : "Soft Drinks"),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    children: [
                      ItemsWidget(),
                      ItemsWidget2(),
                      ItemsWidget3(),
                      ItemsWidget4(),
                      ItemsWidget5(),
                    ],
                  ),
                ),
              ],
            ),
          ),
       ),
      ),
    );
  }
}