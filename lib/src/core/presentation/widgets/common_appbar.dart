import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';

AppBar commonAppbar(BuildContext context, {String? title}) => AppBar(
      backgroundColor: UiColors.backgroundColor,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          color: UiColors.secondaryColor,
        ),
      ),
      title: title != null
          ? Text(
              title,
              style: h2,
            )
          : null,
    );
