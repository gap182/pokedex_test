import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';
import 'package:pokemon_test/src/core/domain/entities/pokemon_entity.dart';
import 'package:pokemon_test/src/core/theme/colors.dart';
import 'package:pokemon_test/src/core/theme/type.dart';
import 'package:pokemon_test/src/core/utils/int_extension.dart';
import 'package:pokemon_test/src/core/utils/string_extension.dart';
import 'package:pokemon_test/src/core/utils/types_color.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/controllers/selection_tab_controller.dart';
import 'package:pokemon_test/src/features/pokedex/presentation/widgets/type_widget.dart';

class ShowPokemon extends ConsumerWidget {
  const ShowPokemon({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  final PokemonEntity? pokemon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesList = <String>[];

    if (pokemon?.types != null) {
      for (var element in pokemon!.types) {
        typesList.add(element);
      }
    }

    final indexSelected = ref.watch(tabSelectionProvider);

    return Container(
      decoration: BoxDecoration(
        color: typesColor[pokemon?.types[0]]?.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon?.id.formatPokeId() ?? "",
                  style: h3,
                ),
                Container(
                  width: 60.w,
                  height: 3,
                  decoration: BoxDecoration(
                    color: UiColors.secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (pokemon != null)
              Column(
                children: [
                  SizedBox(
                    height: 200.h,
                    child: CachedNetworkImage(imageUrl: pokemon!.imageUrl),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    pokemon!.name.upperCaseFirst,
                    style: h2.copyWith(color: typesColor[typesList[0]]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      typesList.length,
                      (index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: TypeWidget(
                          color: typesColor[typesList[index]],
                          text: typesList[index].upperCaseFirst,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _Tab(
                        text: S.of(context).about,
                        typesList: typesList,
                        indexSelected: indexSelected.indexSelected,
                        index: 0,
                      ),
                      _Tab(
                        text: S.of(context).stats,
                        typesList: typesList,
                        indexSelected: indexSelected.indexSelected,
                        index: 1,
                      ),
                      _Tab(
                        text: S.of(context).abilities,
                        typesList: typesList,
                        indexSelected: indexSelected.indexSelected,
                        index: 2,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (indexSelected.indexSelected == 0)
                    _About(
                      height: pokemon?.height,
                      weight: pokemon?.weight,
                      baseExperience: pokemon?.baseExperience,
                    )
                ],
              )
          ],
        ),
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About({
    Key? key,
    this.height,
    this.weight,
    this.baseExperience,
  }) : super(key: key);

  final int? height;
  final int? weight;
  final int? baseExperience;

  @override
  Widget build(BuildContext context) {
    final data = [height, weight, baseExperience];
    final texts = [
      S.of(context).height,
      S.of(context).weight,
      S.of(context).baseExperience
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      height: 100.h,
      decoration: BoxDecoration(
          color: UiColors.backgroundColor,
          borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
            children: List.generate(
                3,
                (index) => Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              texts[index],
                              style: normalText,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data[index].toString(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ))),
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({
    Key? key,
    required this.typesList,
    required this.text,
    required this.indexSelected,
    required this.index,
  }) : super(key: key);

  final List<String> typesList;
  final String text;
  final int indexSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer(
          builder: (context, ref, child) {
            return GestureDetector(
              onTap: () {
                ref.read(tabSelectionProvider.notifier).state =
                    SelectionTabState(indexSelected: index);
              },
              child: Text(
                text,
                style: normalText.copyWith(color: Colors.black),
              ),
            );
          },
        ),
        const SizedBox(
          height: 5,
        ),
        if (index == indexSelected)
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              color: UiColors.secondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
      ],
    );
  }
}
