import 'package:flutter/material.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/constants/translation_constants.dart';
import 'package:mcuapp/common/extensions/string_extensions.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/domain/entities/app_error.dart';
import 'package:mcuapp/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import 'package:mcuapp/presentation/widgets/button.dart';
import 'package:wiredash/wiredash.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget({
    Key key,
    @required this.errorType,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return //7
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
        //1
        child: Column(
          //6
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //2
            Text(
              errorType == AppErrorType.api
                  ? TranslationConstants.somethingWentWrong.t(context)
                  : TranslationConstants.checkNetwork.t(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            //3
            ButtonBar(
              children: [
                //4
                Button(
                  onPressed: onPressed,
                  text: TranslationConstants.retry,
                ),
                //5
                Button(
                  onPressed: () => Wiredash.of(context).show(),
                  text: TranslationConstants.feedback,
                ),
              ],
            ),
          ],
        ),
      );
  }
}
