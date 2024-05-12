import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:monipoint/core/view_models/sample_map_view_model.dart';
import 'package:monipoint/ui/widgets/custom_marker.dart';
import 'package:monipoint/ui/widgets/option_item.dart';

class SampleMap extends ConsumerStatefulWidget {
  const SampleMap({super.key});

  @override
  ConsumerState<SampleMap> createState() => _SampleMapState();
}

class _SampleMapState extends ConsumerState<SampleMap> {

  ///map style theme
  String mapTheme = '';

  ///completer for google map
  Completer<GoogleMapController> _mapCompleter = Completer();

  ///default camera position for map loading up
  final CameraPosition _defaultPosition =
      CameraPosition(target: LatLng(25.9861, 63.0300), zoom: 14);

  @override
  void initState() {
    final _mapVm = ref.read(mapVm);
    _mapVm.updateToggle();
    DefaultAssetBundle.of(context)
        .loadString("assets/map/dark_theme.json")
        .then((value) => _mapVm.mapTheme = value);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final _mapVm = ref.watch(mapVm);
    return Stack(
      children: [
        ///google map interface
        GoogleMap(
          myLocationButtonEnabled: false,
          initialCameraPosition: _defaultPosition,
          onMapCreated: (controller) {
            _mapCompleter.complete(controller);
          },
          style: _mapVm.mapTheme,
        ),

        actionButtons(context: context, mapVm: _mapVm),
        searchFieldArea(context: context),
        ///custom markers to simulate the presentation animation on dribble
        CustomMarker(
          mapVm: _mapVm,
          top: 350.h,
          left: 250.w,
        ),
        CustomMarker(
          mapVm: _mapVm,
          top: 200.h,
          left: 80.w,
        ),
        CustomMarker(
          mapVm: _mapVm,
          top: 220.h,
          left: 250.w,
        ),
        CustomMarker(
          mapVm: _mapVm,
          top: 140.h,
          left: 60.w,
        ),
        CustomMarker(
          mapVm: _mapVm,
          top: 350.h,
          left: 80.w,
        ),
        CustomMarker(
          mapVm: _mapVm,
          top: 440.h,
          left: 250.w,
        ),



      ],
    );
  }

  ///search field area
  searchFieldArea({required BuildContext context}) => Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 15.h),
            child: Row(
              children: [
                Expanded(
                  child: ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.r))),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/search_outline.svg",
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextFormField(
                                keyboardType: TextInputType.number,
                                enabled: true,
                                cursorColor: Colors.black,
                                showCursor: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    suffixIconConstraints: BoxConstraints(
                                      minWidth: 27.w,
                                      minHeight: 27.h,
                                    ),
                                    hintText: 'Saint Petersburg',
                                    hintStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black)),
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                ZoomIn(
                  duration: Duration(seconds: 2),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/filter.svg",
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  ///action buttons
  actionButtons(
          {required BuildContext context, required SampleMapViewModel mapVm}) =>
      Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, bottom: 110.h),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ZoomIn(
                        duration: Duration(seconds: 2),
                          child: GestureDetector(
                            onTap: () => mapVm.selected = !mapVm.selected,
                            child: Container(
                              height: 50.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.6),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/icons/stack.svg",
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                            ),
                          ),
                        ),
                      SizedBox(
                        height: 5.h,
                      ),
                      ZoomIn(
                        duration: Duration(seconds: 2),
                        child: Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.6),
                              shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset(
                              "assets/icons/arrow.svg",
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ZoomIn(
                    duration: Duration(seconds: 2),
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.r))),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/list.svg",
                            width: 24.w,
                            height: 24.h,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'List of variants',
                            style: TextStyle(color: Colors.white, fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                  bottom: 60,
                  child: ZoomIn(
                    duration: Duration(milliseconds: 500),
                    animate: !mapVm.selected,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.r))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          4,
                          (index) => OptionItem(
                            index: index,
                            mapVm: mapVm,
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );
}
