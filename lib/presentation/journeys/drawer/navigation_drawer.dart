import 'package:flutter/material.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:mcuapp/presentation/widgets/logo.dart';

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
                title: 'Favorite Movies',
                onPressed: () {}
                ),
            NavigationListItem(
                title: 'Feedback',
                onPressed: () {}
            ),
            NavigationExpandedListItem(
                title: 'Language',
                children: ['English', 'Spanish'],
                onPressed: () {},
            ),
            NavigationListItem(
                title: 'About',
                onPressed: () {}
            ),
          ],
        ),
      ),
    );
  }
}
