import 'package:flutter/material.dart';

class EditAmountPopup extends StatelessWidget {
  final String title;

  const EditAmountPopup({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  RadioListTile(
                    title: Text('1 - 50'),
                    value: 1,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('51 - 100'),
                    value: 2,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  RadioListTile(
                    title: Text('> 100'),
                    value: 3,
                    groupValue: 1,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Confirm'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                  ),
                  SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.grey,
                      minimumSize: Size(double.infinity, 50), // Full width
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showEditAmountPopup(BuildContext context, String title) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    ),
    builder: (context) => EditAmountPopup(title: title),
  );
}
