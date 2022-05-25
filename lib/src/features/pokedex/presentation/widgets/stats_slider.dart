import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class StatsSlider extends StatelessWidget {
  const StatsSlider({
    Key? key,
    required this.value,
    this.color,
    this.variant,
  }) : super(key: key);

  final double value;
  final Color? color;
  final Color? variant;

  @override
  Widget build(BuildContext context) {
    return NeumorphicSlider(
      min: 0,
      max: 200,
      value: value,
      style: SliderStyle(
        accent: color,
        variant: variant,
      ),
    );
  }
}
