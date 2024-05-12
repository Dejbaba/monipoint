import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:monipoint/core/constants/color_path.dart';
import 'package:monipoint/core/utilities/utilities.dart';
import 'package:monipoint/core/view_models/bottom_nav_view_model.dart';


class TabItem extends StatefulWidget {
  final int index;
  const TabItem({super.key, required this.index});

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child){
        final _model = ref.watch(bottomNavVm);
        final _selectedItem = widget.index == _model.currentIndex;
        return InkWell(
          onTap: (){
            _model.updateIndex(widget.index);
            _model.updateState();
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.only(right: widget.index != 4 ? 8.w : 0.w),
                height: _selectedItem ? 50.h : 45.h,
                width: _selectedItem ? 50.w : 45.w,
                decoration: BoxDecoration(
                    color: _selectedItem ? ColorPath.poppyOrange : Colors.black,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: SvgPicture.asset(
                    "${Utilities.navIcon(index: widget.index)}",
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              if(_model.showNavEffect && _selectedItem)
              Container(
                height: 50.h,
                  child: Lottie.asset('assets/json/click_animation.json', repeat: false,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,))
            ],
          ),
        );
      },
    );
  }
}
