import 'package:flutter/material.dart';

class UserMedResult extends StatefulWidget {
  @override
  _UserMedResultState createState() => _UserMedResultState();
}

class _UserMedResultState extends State<UserMedResult> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 209, 214),
        title: const Text('List of Medicines'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              title: const Text('Medicine Name'),
              subtitle: const Text('Medicine Description'),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {},
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Nearby Pharmacies"),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Icon(Icons.local_pharmacy),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Pharmacy Name'),
                        Text('Pharmacy Address'),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {},
                    ),
                  ],
                ),
              );
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    );
  }
}
