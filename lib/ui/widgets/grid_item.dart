import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint/core/utilities/utilities.dart';


class GridItem extends StatelessWidget {
  final bool isFirstItem;
  const GridItem({super.key, this.isFirstItem = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        image: DecorationImage(
          image: AssetImage('${Utilities.randomImage()}'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SlideInLeft(
          duration: Duration(seconds: 1),
          child: Container(
            height: isFirstItem ? 50.h : 35.h,
            width: double.infinity,
            margin: isFirstItem ? EdgeInsets.only(bottom: 15.h, left: 15.w, right: 15.w)
                :EdgeInsets.only(bottom: 15.h, left: 10.w, right: 10.w),
            padding: isFirstItem ? EdgeInsets.symmetric(horizontal: 0.5.w, vertical: 2.h)
                : EdgeInsets.only(right: 0.5.w, left: 8.w, top: 2.h, bottom: 2.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32.r)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.8),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(isFirstItem)
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle
                    ),
                  ),
                FadeIn(
                  delay: Duration(seconds: 1),
                  key: UniqueKey(),
                  duration: Duration(seconds: 1),
                  child: Text(
                    isFirstItem ? 'Gladkova St., 25' : 'Sample text',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: SlideInLeft(
                    duration: Duration(seconds: 1),
                    child: Container(
                      height: isFirstItem ? 50.h : 35.h,
                      width: isFirstItem ? 50.w : 35.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward_ios, size: 12, color: Colors.black,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
