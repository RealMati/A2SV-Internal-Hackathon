import 'package:ample_click/presentation/widgets/search_feild.dart';
import 'package:ample_click/utils/dummy_data_home.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserHomeInner extends StatelessWidget {
  const UserHomeInner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Theme.of(context).splashColor,
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 20),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, bottom: 20, top: 10),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Save Time and Effort!",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                          "No more running around - Find what you need in just a few taps!")
                    ],
                  ),
                ),
                const SearchFeild(hint_text: "Search for medicine here..."),
              ],
            ),
          ),
        ),
        Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: meds.length,
                itemBuilder: (context, index) {
                  final item = meds[index];
                  return SizedBox(
                    height: 400,
                    width: 350,
                    child: InkWell(
                      onTap: () {
                        context.go('/user/searched_med_detail');
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width: double.infinity,
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
                                padding: const EdgeInsets.only(left: 5),
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }))
      ],
    );
  }
}
