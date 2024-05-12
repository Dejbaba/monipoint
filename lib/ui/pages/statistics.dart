import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monipoint/core/constants/color_path.dart';
import 'package:monipoint/core/utilities/utilities.dart';
import 'package:monipoint/ui/widgets/grid_item.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics>{

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [ColorPath.greyWhite, Colors.orangeAccent.withOpacity(0.3)],
          stops: [0.2, 0.8],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///location and avatar
            locationAndAvatar(context: context),
            SizedBox(height: 30.h,),
            welcomeTextAndDescription(context: context),
            SizedBox(height: 35.h,),
            statsAndGridView(context: context)
          ],
        ),
      ),
    );
  }

  ///sample avatar and location details
  locationAndAvatar({required BuildContext context}) => Padding(
    padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SlideInLeft(
          duration: Duration(seconds: 1),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r))
            ),
            child: FadeIn(
              delay: Duration(milliseconds: 800),
              duration: Duration(seconds: 1),
              child: Row(
                children: [
                  Icon(Icons.location_pin, size: 20, color: ColorPath.donkeyBrown,),
                  SizedBox(width: 2.w,),
                  Text(
                    'Saint Petersburg',
                    style: TextStyle(
                        color: ColorPath.donkeyBrown,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        ZoomIn(
          duration: Duration(seconds: 2),
          child: Image.asset(
            'assets/images/avatar.png',
            height: 48.h,
            width: 48.w,
          ),
        )

      ],
    ),
  );
  ///welcome text and description
  welcomeTextAndDescription({required BuildContext context}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 25.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FadeIn(
          duration: Duration(milliseconds: 600),
          child: Text(
            'Hi, Marina',
            style: TextStyle(
                color: ColorPath.donkeyBrown,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
        SizedBox(height: 2.h,),
        SlideInUp(
          from: 45,
          duration: Duration(milliseconds: 800),
          child: Text(
            "let's select your",
            style: TextStyle(
                color: Colors.black,
                fontSize: 35.sp,
                fontWeight: FontWeight.w500,
                height: 1.1
            ),
          ),
        ),
        SizedBox(height: 1.h,),
        SlideInUp(
          from: 45,
          delay: Duration(milliseconds: 200),
          duration: Duration(milliseconds: 800),
          child: Text(
            "perfect place",
            style: TextStyle(
                color: Colors.black,
                fontSize: 35.sp,
                fontWeight: FontWeight.w500,
                height: 1.1
            ),
          ),
        ),
      ],
    ),
  );
  ///statistics(circle and rectangle) and scattered gridview
  statsAndGridView({required BuildContext context}) =>  Expanded(
    child: Stack(
      children: [
        ///circle and rectangle
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Row(
            children: [
              Expanded(
                child: ZoomIn(
                  duration: Duration(seconds: 2),
                  child: Stack(
                    children: [
                      Container(
                        height: 200.h,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        decoration: BoxDecoration(
                          color: ColorPath.poppyOrange,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 1034),
                                  duration: Duration(milliseconds: 1500),
                                  builder: (context, val, child){
                                    return Text(
                                      "${Utilities.formatInput(input: val.toInt().toString())}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w900,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 2.h,),
                                Text(
                                  "offers",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 10.h,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 16.h),
                            child: Text(
                              "BUY",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: ZoomIn(
                  duration: Duration(seconds: 2),
                  child: Stack(
                    children: [
                      Container(
                        height: 180.h,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(16.r))
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 25.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TweenAnimationBuilder(
                                  tween: Tween<double>(begin: 0, end: 2212),
                                  duration: Duration(milliseconds: 1500),
                                  builder: (context, val, child){
                                    return Text(
                                      "${Utilities.formatInput(input: val.toInt().toString())}",
                                      style: TextStyle(
                                          color: ColorPath.donkeyBrown,
                                          fontSize: 35.sp,
                                          fontWeight: FontWeight.w900,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 2.h,),
                                Text(
                                  "offers",
                                  style: TextStyle(
                                      color: ColorPath.donkeyBrown,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: 10.h,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h),
                            child: Text(
                              "RENT",
                              style: TextStyle(
                                  color: ColorPath.donkeyBrown,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ///draggable scrollable sheet
        SlideInUp(
          duration: Duration(seconds: 1),
          child: DraggableScrollableSheet(
            initialChildSize: 0.63,
            minChildSize: 0.63,
            maxChildSize: 1,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                padding: EdgeInsets.only(top: 7.h, left: 7.w, right: 7.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32.r),
                    topRight: Radius.circular(32.r),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  children: [
                    StaggeredGrid.count(
                      crossAxisCount: 4,
                      mainAxisSpacing: 8.h,
                      crossAxisSpacing: 8.w,
                      children: [
                        StaggeredGridTile.count(
                            crossAxisCellCount: 4,
                            mainAxisCellCount: 2.2,
                            child: GridItem(isFirstItem: true,)
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 3,
                          child: GridItem(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1.5,
                          child: GridItem(),
                        ),
                        StaggeredGridTile.count(
                          crossAxisCellCount: 2,
                          mainAxisCellCount: 1.5,
                          child: GridItem(),
                        ),

                      ],
                    ),

                  ],
                ),
              );
            },),
        )
      ],
    ),
  );
}
