import 'package:flutter/material.dart';
import 'package:ecommerce/data.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)!.settings.arguments;

    if (argument == null || argument is! Product) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: const Center(child: Text('Could not load product details.')),
      );
    }
    final product = argument;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  child: Image.asset(
                    product.imageurl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 24,
                  child: GestureDetector(
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
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.category,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Color(0xffFFD700)),
                          Text(
                            '(4.0)',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xffaaaaaa),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xff666666),
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Size:',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff3e3e3e),
                    ),
                  ),

                  Segment(),
                  SizedBox(height: 20),
                  Text(
                    product.description,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff666666),
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 8,
                top: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(152, 50),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xffff1313)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'DELETE',
                      style: TextStyle(
                        color: Color(0xffff1313),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(152, 50),
                      maximumSize: Size(152, 50),
                      backgroundColor: Color(0xff3F51F3),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff3F51F3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Segment extends StatefulWidget {
  const Segment({super.key});

  @override
  State<Segment> createState() => _SegmentState();
}

class _SegmentState extends State<Segment> {
  int intView = 41;
  final List<int> sizes = [39, 40, 41, 42, 43, 44];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: sizes.map((size) {
        final isSelected = intView == size;
        return ElevatedButton(
          onPressed: () {
            setState(() {
              intView = size;
            });
          },
          style: ElevatedButton.styleFrom(
            fixedSize: Size(60, 60),
            backgroundColor: isSelected ? Color(0xff3F51F3) : Colors.white,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),

            side: BorderSide(
              color: isSelected ? Color(0xff3F51F3) : Color(0xffffffff),
              width: 1,
            ),
          ),
          child: Text(
            '$size',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }
}
