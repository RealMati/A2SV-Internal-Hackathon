import 'package:ample_click/List-Of-Medicine.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});

  final _selected = 0;

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
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
    return SafeArea(
      child: Scaffold(
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
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: filteredMedicines.length,
                    itemBuilder: (context, index) {
                      final item = filteredMedicines[index];
                      return SizedBox(
                        height: 400,
                        width: 350,
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
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Image.asset(
                                          'assets/pharma_profile.jpg',
                                          fit: BoxFit.cover),
                                    )),
                                Container(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item,
                                        maxLines: 2,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const Text('Description not available',
                                          style: TextStyle(
                                              fontSize: 14, color: Colors.grey))
                                    ],
                                  ),
                                )
                              ],
                            ),
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
