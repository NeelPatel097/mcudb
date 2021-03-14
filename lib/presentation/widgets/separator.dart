import 'package:flutter/cupertino.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';

class Separator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:Sizes.dimen_1.h,
      width:Sizes.dimen_80.w,
      padding: EdgeInsets.only(
        top: Sizes.dimen_2.h,
        bottom: Sizes.dimen_6.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_1.h)),
        gradient: LinearGradient(
          colors: [
            AppColor.white,
            AppColor.marvelRed,
          ],
        ),
      ),
    );
  }
}
