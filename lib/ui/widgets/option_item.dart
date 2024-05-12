import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monipoint/core/constants/color_path.dart';
import 'package:monipoint/core/utilities/utilities.dart';
import 'package:monipoint/core/view_models/sample_map_view_model.dart';

class OptionItem extends StatelessWidget {
  final String description;
  final int index;
  final SampleMapViewModel mapVm;
  const OptionItem({super.key, required this.mapVm, required this.index, this.description = 'Sample Text'});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: index == 3 ? 0:20.h),
      child: GestureDetector(
        onTap: (){
          mapVm.selected = true;
          mapVm.updateToggle(refreshUi: true, firstCall: false);
        },
        child: Row(
          children: [
            SvgPicture.asset(
              "${Utilities.options[index]}",
              width: 24.w,
              height: 24.h,
            ),
            SizedBox(width: 10.w,),
            Text(
              "${Utilities.optionDescription[index]}",
              style: TextStyle(
                color: index == 1 ? ColorPath.poppyOrange:ColorPath.donkeyBrown,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
