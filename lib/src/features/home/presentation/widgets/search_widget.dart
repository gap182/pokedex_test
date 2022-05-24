import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_test/generated/l10n.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Neumorphic(
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
                onChanged: (v) => print(v),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("search");
              },
              child: const Icon(
                Icons.search,
              ),
            )
          ],
        ),
      ),
    );
  }
}
