import 'package:ample_click/utils/dummy_data_home.dart';
import 'package:ample_click/widgets/search_feild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmacyHome extends StatefulWidget {
  const PharmacyHome({super.key});

  final _selected = 0;

  @override
  State<PharmacyHome> createState() => _PharmacyHomeState();
}

class _PharmacyHomeState extends State<PharmacyHome> {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Card(
                    elevation: 12,
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 20),
                    child:
                        SearchFeild(hint_text: "Search for medicine here..."),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Status",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.toggle_on,
                            size: 50,
                            color: Theme.of(context).colorScheme.primary,
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, bottom: 10),
              child: Text(
                "Add Medicines To Store",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
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
                                  width: 80,
                                  height: 80,
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(item['description'],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.toggle_on,
                                      size: 40,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    )),
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
