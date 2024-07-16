import 'package:flutter/material.dart';

void showRemovePopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RemovePopup();
    },
  );
}

class RemovePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.delete,
            color: Colors.red,
            size: 40.0,
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Remove',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Are you sure you want to delete this Medicine? This action cannot be undone.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            // Add your remove action here
            Navigator.of(context).pop();
          },
          child: Text('Remove'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            minimumSize: Size(double.infinity, 50), // Full width
          ),
        ),
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
    );
  }
}
