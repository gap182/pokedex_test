import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/features/home/presentation/widgets/pokedex_button.dart';
import 'package:pokemon_test/src/features/home/presentation/widgets/search_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: UiColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Text(S.of(context).homeTitle, style: h1),
                    ],
                  ),
                ),
                Column(
                  children: const [
                    SearchWidget(),
                    SizedBox(height: 40),
                    PokedexButton(),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100.h,
                      width: double.infinity,
                      child: Image.asset(
                        "assets/images/pokemon_meet.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
