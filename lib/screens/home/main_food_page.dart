// create statefull widget for food page
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/screens/home/food_page_body.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
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
                margin: EdgeInsets.only(top: Dimensions.height45, bottom: Dimensions.height15),
                padding: EdgeInsets.only(left: Dimensions.width45, right: Dimensions.width45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          MainTitle(title: 'Venezuela', color: AppColors.mainColor),
                          Row(
                            children:[
                              MainText(text: 'Guatire'),
                              Icon(Icons.arrow_drop_down_rounded, color: AppColors.mainColor, size: Dimensions.iconSize22),
                            ]
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          width: Dimensions.height45,
                          height: Dimensions.height45,
                          child: Icon(Icons.search, color: AppColors.iconColor, size: Dimensions.iconSize22),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimensions.radius15),
                            color: AppColors.mainColor,
                          ),
                        ),
                      )
                    ],
                  )
              )
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ]
      ),
    );
  }
}

