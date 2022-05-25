import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PikachuImage extends StatelessWidget {
  const PikachuImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Row(
        children: [
          const Spacer(),
          SizedBox(
            height: 150.h,
            child: Image.asset('assets/images/detective_pikachu.png'),
          ),
        ],
      ),
    );
  }
}
