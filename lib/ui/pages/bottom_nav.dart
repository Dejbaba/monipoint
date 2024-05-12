import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monipoint/core/view_models/bottom_nav_view_model.dart';
import 'package:monipoint/core/constants/color_path.dart';
import 'package:monipoint/ui/widgets/tab_item.dart';

class BottomNav extends ConsumerStatefulWidget {
  const BottomNav({super.key});

  @override
  ConsumerState<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends ConsumerState<BottomNav> {
  @override
  Widget build(BuildContext context) {
    final _model = ref.watch(bottomNavVm);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _model.children.elementAt(_model.currentIndex),
          FadeInUp(
            delay: Duration(milliseconds: 1500
            ),
            duration: Duration(milliseconds: 800),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 30.h),
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                decoration: BoxDecoration(color: ColorPath.greyBlack,
                  borderRadius: BorderRadius.all(Radius.circular(42.r))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_model.children.length, (index) => TabItem(index: index)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
