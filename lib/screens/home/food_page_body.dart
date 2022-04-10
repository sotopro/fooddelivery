import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/main_icon_text.dart';
import 'package:fooddelivery/widgets/main_text.dart';
import 'package:fooddelivery/widgets/main_title.dart';

class FoodPageBody extends StatefulWidget {
  @override
  _FoodPageBodyState createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;
  @override
  void initState(){
    super.initState();
    pageController.addListener((){
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: Dimensions.pageView,
            child: PageView.builder(
                controller: pageController,
                itemCount: 5,
                itemBuilder: (context, position){
                  return _buildPageItem(position);
                })
        ),
        new DotsIndicator(
            dotsCount: 5,
            position: _currentPageValue,
            decorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimensions.radius20)),
                activeColor: AppColors.mainColor,
                color: AppColors.grey
            )
        ),
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width45),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              MainTitle(title: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: MainTitle(title: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: MainText(text: 'Food pairing')
              )
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, position) {
            return Container(
              margin: EdgeInsets.only(left: Dimensions.width45, right: Dimensions.width45, bottom: Dimensions.height10),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.listViewImageSize,
                    height: Dimensions.listViewImageSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('assets/images/food01.jpg'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                    height: Dimensions.listViewTextContainerSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        bottomRight: Radius.circular(Dimensions.radius20)
                      ),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MainTitle(title: 'Nutritious fruit meal in China'),
                          SizedBox(height: Dimensions.height10),
                          MainText(text: 'With cinese characteristics the fruit is a healthy food, and it is a good source of protein, vitamin C, and other nutrients.'),
                          SizedBox(height: Dimensions.height15), 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainIconText(icon: Icons.circle_sharp, text: 'Normal', iconColor: Colors.amber.shade400),
                              MainIconText(icon: Icons.location_on_sharp, text: '1.5 km', iconColor: AppColors.secondaryColor),
                              MainIconText(icon: Icons.access_time_sharp, text: '30 min', iconColor: Colors.red.shade400),
                            ]
                        ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  ],
              )
            );
        }
        ),
      ],
    );
  }
  Widget _buildPageItem(int position) {
    Matrix4 matrix = new Matrix4.identity();
    if(position == _currentPageValue.floor()){
      var currentScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransform, 0);
    } else if (position == _currentPageValue.floor() + 1) {
      var currentScale = _scaleFactor + (_currentPageValue - position + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransform, 0);
    } else if (position == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - position) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
        transform: matrix,
        child: Stack(
          children: [
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: position.isEven ? AppColors.mainColor : AppColors.secondaryColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/food01.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.pageViewTextContainer,
                  margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.backgroundColorSecondary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black,
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(-5, 0),
                      ),
                      BoxShadow(
                        color: AppColors.white,
                        offset: Offset(5, 0),
                      )
                    ],
                  ),
                  child: Container(
                    padding: EdgeInsets.all(Dimensions.height20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MainTitle(title: 'Beef Curry'),
                        SizedBox(height: Dimensions.height10),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor, size: 15)),
                            ),
                            SizedBox(width: Dimensions.height10),
                            MainText(text: '4.5'),
                            SizedBox(width: Dimensions.height10),
                            MainText(text: '1287'),
                            SizedBox(width: Dimensions.height10),
                            MainText(text: 'comments'),
                          ],
                        ),
                        SizedBox(height: Dimensions.height10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainIconText(icon: Icons.circle_sharp, text: 'Normal', iconColor: Colors.amber.shade400),
                              SizedBox(width: Dimensions.height10),
                              MainIconText(icon: Icons.location_on_sharp, text: '1.5 km', iconColor: AppColors.secondaryColor),
                              SizedBox(width: Dimensions.height10),
                              MainIconText(icon: Icons.access_time_sharp, text: '30 min', iconColor: Colors.red.shade400),
                            ]
                        ),
                      ],
                    ),
                  )
              ),
            )
          ],
        ),
    );
  }
}