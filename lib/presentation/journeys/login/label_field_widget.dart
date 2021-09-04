import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcuapp/common/constants/size_constants.dart';
import 'package:mcuapp/common/extensions/size_extensions.dart';

class LabelFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;
  final UnderlineInputBorder _enabledBorder = const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  );

  final UnderlineInputBorder _focusedBorder = const UnderlineInputBorder(
    borderSide: BorderSIde(
      color: Colors.white,
    ),
  );

  const LabelFieldWidget({
    Key key,
    @required this.label,
    @required this.hintText,
    @required this.controller,
    this.isPasswordField = false,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.dimen_8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.start,
          ),
          TextField(
            obscureText: isPasswordField,
            obscuringCharacter: '*',
            controller: controller,
            style: Theme.of(context).textTheme.headline6,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.greySubtitle1,
              focusedBorder: _focusedBorder,
              enabledBorder: _enabledBorder,
            ),
          ),
        ],
      ),
    );
  }
}
