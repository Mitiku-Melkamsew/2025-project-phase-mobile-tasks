import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, size: 60, color: Colors.grey[700]),
                  SizedBox(height: 10),
                  Text(
                    'Tap to upload image',
                    style: TextStyle(color: Colors.grey[700], fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Text('Name'),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text('Category'),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('Price'),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              suffixText: '\$',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text('Description'),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Your logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade700, // Blue background
              minimumSize: Size(
                double.infinity,
                50,
              ), // Full width, fixed height
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
            child: Text(
              "ADD",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),

          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Delete',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
