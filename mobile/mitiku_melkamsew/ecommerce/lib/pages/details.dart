import 'package:flutter/material.dart';
import '../data.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments;

    if (argument == null || argument is! Product) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
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
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
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
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.category,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xffaaaaaa),
                        ),
                      ),
                      const Row(
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
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xff666666),
                        ),
                      ),
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          decoration: TextDecoration.none,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xff666666),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Size:',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Color(0xff3e3e3e),
                    ),
                  ),

                  const Segment(),
                  const SizedBox(height: 20),
                  Text(
                    product.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color(0xff666666),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                      minimumSize: const Size(152, 50),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xffff1313)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
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
                      minimumSize: const Size(152, 50),
                      maximumSize: const Size(152, 50),
                      backgroundColor: const Color(0xff3F51F3),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff3F51F3)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
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
            fixedSize: const Size(60, 60),
            backgroundColor: isSelected ? const Color(0xff3F51F3) : Colors.white,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),

            side: BorderSide(
              color: isSelected ? const Color(0xff3F51F3) : const Color(0xffffffff),
              width: 1,
            ),
          ),
          child: Text(
            '$size',
            style: const TextStyle(
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
