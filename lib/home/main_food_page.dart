// create statefull widget for food page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/home/food_page_body.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/widgets/main_text.dart';
import 'package:fooddelivery/widgets/main_title.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);
  @override
  _MainFoodPageState createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(

              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          MainTitle(title: 'Venezuela', color: AppColors.mainColor),
                          Row(
                            children:[
                              MainText(text: 'Guatire'),
                              Icon(Icons.arrow_drop_down_rounded, color: AppColors.mainColor, size: 20,),
                            ]
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: 45,
                          height: 45,
                          child: Icon(Icons.search, color: AppColors.iconColor),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          FoodPageBody(),
        ]
      ),
    );
  }
}

