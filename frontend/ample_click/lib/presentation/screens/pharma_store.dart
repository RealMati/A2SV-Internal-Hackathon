import 'package:ample_click/presentation/widgets/edit_and_add_popup.dart';
import 'package:ample_click/presentation/widgets/remove_popup.dart';
import 'package:ample_click/utils/dummy_data_home.dart';
import 'package:ample_click/widgets/search_feild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmacyStore extends StatefulWidget {
  const PharmacyStore({super.key});

  final _selected = 1;

  @override
  State<PharmacyStore> createState() => _PharmacyStoreState();
}

class _PharmacyStoreState extends State<PharmacyStore> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.chevron_left)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 12,
                  margin: EdgeInsets.fromLTRB(8, 8, 8, 20),
                  child: SearchFeild(
                    hint_text: "Search for medicine here...",
                    onChanged: (value) {},
                    controller: _controller,
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 16, top: 10, bottom: 10),
              child: Text(
                "List of Medicines in Store",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: meds.length,
                    itemBuilder: (context, index) {
                      final item = meds[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: 40,
                                  height: 60,
                                  child: ClipPath(
                                    clipper: ShapeBorderClipper(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    child: Image(
                                      image: AssetImage(item['image']),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                              Container(
                                padding: const EdgeInsets.only(left: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['title'],
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(item['description'],
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                          onPressed: () {
                                            showEditAmountPopup(
                                                context, 'Edit Amount ');
                                          },
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                    Expanded(
                                      child: TextButton(
                                          onPressed: () {
                                            showRemovePopup(context);
                                          },
                                          child: const Text(
                                            "Remove",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget._selected,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.store), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.storefront_sharp), label: "On Store"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
