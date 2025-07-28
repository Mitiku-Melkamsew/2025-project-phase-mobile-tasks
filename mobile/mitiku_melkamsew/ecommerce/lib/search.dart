import 'package:ecommerce/utils/card.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
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
                child: ListView(children: [Product(), Product()]),
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
