import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xff3F51F3),
            size: 20,
          ),
        ),
        title: Center(
          child: Text(
            'Search product',
            style: TextStyle(
              color: Color(0xff3e3e3e),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      SizedBox(
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Leather',
                            hintStyle: TextStyle(
                              color: Color(0xff3e3e3e),
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff3F51F3),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff3F51F3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 300,
                child: ListView(
                  children: [
                    Card(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                            ),
                            child: Image.asset(
                              'assets/1.jpg',
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Derby leather shoes',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Text(
                                      '\$120',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff3e3e3e),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Men\'s shoe',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffaaaaaa),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFFD700),
                                        ),
                                        Text(
                                          '(4.0)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Sora',
                                          ),
                                        ),
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
                    Card(
                      color: Color(0xffffffff),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16),
                            ),
                            child: Image.asset(
                              'assets/1.jpg',
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Derby leather shoes',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Text(
                                      '\$120',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xff3e3e3e),
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Men\'s shoe',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xffaaaaaa),
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 20,
                                          color: Color(0xffFFD700),
                                        ),
                                        Text(
                                          '(4.0)',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffaaaaaa),
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Sora',
                                          ),
                                        ),
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
              ),
            ),
            Text(
              'category',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffD9D9D9)),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Price',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            RangeSlider(
              activeColor: Color(0xff3F51F3),
              values: RangeValues(20, 80),
              min: 0,
              max: 100,
              onChanged: (RangeValues values) {},
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff3F51F3),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "APPLY",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xffffffff),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
