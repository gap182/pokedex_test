import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/src/core/theme/type.dart';

class TypeWidget extends StatelessWidget {
  const TypeWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.text,
  }) : super(key: key);

  final double? height;
  final double? width;
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ?? 150.w,
      height: height ?? 40.h,
      decoration: BoxDecoration(
          border: Border.all(
            color: color ?? Colors.white,
          ),
          borderRadius: BorderRadius.circular(80)),
      child: Text(
        text ?? '',
        style: normalText.copyWith(color: color),
      ),
    );
  }
}
