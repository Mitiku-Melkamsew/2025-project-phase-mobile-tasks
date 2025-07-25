import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(image: AssetImage('assets/1.jpg')),
                  ),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "July 14, 2023",
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Hello, YOHANNES",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: Stack(
                    children: [
                      Icon(Icons.notifications, color: Colors.grey, size: 24),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 19),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available products',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 186, 206, 223),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: Icon(Icons.search),
                ),
              ),
            ],
          ),
          SizedBox(height: 19),
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: Column(
                    children: [
                      Image(image: AssetImage('assets/1.jpg')),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Derby leather shoes'),
                              Text('\$120'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Men\'s shoe'),
                              Row(children: [Icon(Icons.star), Text('4.0')]),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
