import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monipoint/core/constants/color_path.dart';
import 'package:monipoint/core/view_models/sample_map_view_model.dart';

class CustomMarker extends StatelessWidget {
  final SampleMapViewModel mapVm;
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  const CustomMarker({super.key, this.right, this.bottom, this.top, this.left, required this.mapVm});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      top: top ?? 470.h,
      left: left ?? 200.w,
      child: SafeArea(
        child: ZoomIn(
          delay: Duration(seconds: 1),
          duration: Duration(seconds: 3),
          child: AnimatedContainer(
            curve: Curves.slowMiddle,
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.symmetric(horizontal: mapVm.toggleText ? 14.w : 14.w, vertical: 14.h),
            decoration: BoxDecoration(
                color: ColorPath.poppyOrange,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                )),
            child: Center(
              child: AnimatedCrossFade(
                firstChild: Text(
                  '6,95 mn p', style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                secondChild: SvgPicture.asset(
                  "assets/icons/building.svg",
                  width: 24.w,
                  height: 24.h,
                ),
                crossFadeState: mapVm.toggleText ? CrossFadeState.showFirst:CrossFadeState.showSecond,
                duration: Duration(milliseconds: 500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
