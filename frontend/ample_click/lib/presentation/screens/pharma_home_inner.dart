import 'package:ample_click/List-Of-Medicine.dart';
import 'package:ample_click/presentation/widgets/edit_and_add_popup.dart';
import 'package:flutter/material.dart';

class PharmaHomeInner extends StatefulWidget {
  const PharmaHomeInner({super.key});

  @override
  State<PharmaHomeInner> createState() => _PharmaHomeInnerState();
}

class _PharmaHomeInnerState extends State<PharmaHomeInner> {
  List<String> medicines = [];
  List<String> filteredMedicines = [];
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();

  void getMedicines() {
    medicines = Medicines().getMedicines();
    filteredMedicines = medicines;
  }

  @override
  void initState() {
    super.initState();
    getMedicines();
  }

  void _filterSearch(String value) {
    setState(() {
      filteredMedicines = medicines
          .where((meds) => meds.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? const Text('Search Medicines')
            : TextField(
                onChanged: (value) {
                  _filterSearch(value);
                },
                style: const TextStyle(color: Colors.deepPurple),
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),
                  hintText: "Search Medicines Here",
                  hintStyle: TextStyle(color: Colors.deepPurple[200]),
                ),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                      filteredMedicines = medicines;
                    });
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        size: 40,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
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
              itemCount: filteredMedicines.length,
              itemBuilder: (context, index) {
                final item = filteredMedicines[index];
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
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Image.asset(
                              'assets/image1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          padding: const EdgeInsets.only(left: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Description not available',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              showEditAmountPopup(context, ' Amount In Range');
                            },
                            icon: Icon(
                              Icons.toggle_on,
                              size: 40,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
