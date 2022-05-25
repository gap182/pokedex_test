import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/generated/l10n.dart';
import 'package:pokemon_test/src/core/dependencies/dependencies.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Neumorphic(
      style: const NeumorphicStyle(
        depth: -2,
      ),
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: S.of(context).search,
                ),
                onChanged: ref.read(homeProvider.notifier).changeTextToSearch,
              ),
            ),
            Consumer(
              builder: (context, ref, child) {
                final textToSearch = ref
                    .watch(homeProvider.select((value) => value.textToSearch));
                return GestureDetector(
                  onTap: () async {
                    if (textToSearch != null && textToSearch.isNotEmpty) {
                      ref
                          .read(homeProvider.notifier)
                          .searchPokemon(textToSearch.trim());
                    }
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
