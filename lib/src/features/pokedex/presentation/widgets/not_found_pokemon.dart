import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/theme/type.dart';

class NotFoundPokemon extends ConsumerWidget {
  const NotFoundPokemon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: 100.h,
          width: 100.h,
          child: Image.asset('assets/images/pikachu_black.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          S.of(context).notFoundPokemon,
          style: normalText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
