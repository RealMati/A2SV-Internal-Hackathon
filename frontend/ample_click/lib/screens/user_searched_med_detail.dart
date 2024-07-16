import 'package:ample_click/utils/dummy_data_home.dart';
import 'package:ample_click/utils/dummy_data_pharmacies.dart';
import 'package:ample_click/widgets/search_feild.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserSearchedMedDetail extends StatefulWidget {
  const UserSearchedMedDetail({super.key});

  final _selected = 0;

  @override
  State<UserSearchedMedDetail> createState() => _UserSearchedMedDetailState();
}

class _UserSearchedMedDetailState extends State<UserSearchedMedDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Medicine"),
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.chevron_left)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 230,
              color: Theme.of(context).colorScheme.primaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 100.0),
                      child: Text(
                        meds[0]['title'],
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Row(children: [
                      SizedBox(
                          height: 150,
                          width: 120,
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            child: Image(
                              image: AssetImage(meds[0]['image']),
                              fit: BoxFit.cover,
                            ),
                          )),
                      const Expanded(
                        child: Text(
                            "Description of the drug. Description of the drug.Description of the drug."),
                      )
                    ]),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Text(
                  "Nearby Pharmacies",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: pharmacies.length,
                    itemBuilder: (context, index) {
                      final item = pharmacies[index];
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
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 8),
                                          child: CircleAvatar(
                                            radius: 6,
                                            backgroundColor:
                                                item['status'] == "open"
                                                    ? Colors.green
                                                    : Colors.red,
                                          ),
                                        ),
                                        Text(
                                          item['status'],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5.0),
                                      child: Text(
                                        item['name'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(item['distance'],
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey))
                                  ],
                                ),
                              ),
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
                icon: Icon(Icons.location_on_sharp), label: "Nearby"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
