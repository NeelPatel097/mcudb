import 'package:flutter/material.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/extensions/string_extensions.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';

class Button extends StatelessWidget {

  final String text;
  final Function onPressed;
  final bool isEnabled;

  const Button({
    Key key,
    @required this.text,
    @required this.onPressed,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: isEnabled ? [AppColor.marvelRed, AppColor.marvelRed] :
            [Colors.grey, Colors.grey],
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(Sizes.dimen_20.w),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
        height: Sizes.dimen_16.h,
        child: FlatButton(
            onPressed: onPressed,
            child: Text(
              text.t(context),
              style: Theme.of(context).textTheme.button,
            )
        ),

    );
  }
}
