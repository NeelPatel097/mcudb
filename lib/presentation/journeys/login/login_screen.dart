import 'package:flutter/material.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';
import 'package:mcuapp/presentation/journeys/login/login_form.dart';
import 'package:mcuapp/presentation/widgets/logo.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: Sizes.dimen_32.h),
                child: Logo(height: Sizes.dimen_12.h),
              ),
              LoginForm(),
            ],
          )),
    );
  }
}
