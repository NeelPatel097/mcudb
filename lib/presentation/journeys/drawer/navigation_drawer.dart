import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mcuapp/common/constants/languages.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/constants/translation_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/common/extensions/string_extensions.dart';
import 'package:mcuapp/presentation/app_localizations.dart';
import 'package:mcuapp/presentation/blocs/language/language_bloc.dart';
import 'package:mcuapp/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:mcuapp/presentation/themes/theme_color.dart';
import 'package:mcuapp/presentation/widgets/app_dialog.dart';
import 'package:mcuapp/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import 'navigation_expanded_list_tile.dart';

class NavigationDrawer extends StatelessWidget {

  const NavigationDrawer();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ]
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dimen_8.h,
                  bottom: Sizes.dimen_18.h,
                  left: Sizes.dimen_8.w,
                  right: Sizes.dimen_8.w,
                ),
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),
            NavigationListItem(
                title: TranslationConstants.favoriteMovies.t(context),
                onPressed: () {}
                ),
            NavigationListItem(
                title: TranslationConstants.feedback.t(context),
                onPressed: () {
                  Navigator.of(context).pop();
                  Wiredash.of(context).show();
                }
            ),
            NavigationExpandedListItem(
                title: TranslationConstants.language.t(context),
                children: Languages.languages.map((e) => e.value).toList(),
                onPressed: (index) {
                  BlocProvider.of<LanguageBloc>(context).add(
                      ToggleLanguageEvent(
                          Languages.languages[index],
                      ),
                  );
                },
            ),
            NavigationListItem(
                title: TranslationConstants.about.t(context),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                }
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        child: AppDialog(
            title: TranslationConstants.about,
            description: TranslationConstants.aboutDescription,
            buttonText: TranslationConstants.okay,
            image: Image.asset(
              'assets/pngs/tmdb_logo.png',
              height: Sizes.dimen_32.h,
            ) ,
        ),
    );
  }
}
