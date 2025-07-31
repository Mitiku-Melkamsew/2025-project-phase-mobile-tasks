import 'package:flutter/material.dart';

import '../data.dart';
import '../utils/product_list_view.dart';

class Home extends StatefulWidget {
  final ProductManager productManager;
  const Home({super.key, required this.productManager});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SizedBox(
        width: 72,
        height: 72,
        child: FloatingActionButton(
          splashColor: const Color(0xff3f62f4),
          shape: const CircleBorder(),
          backgroundColor: const Color(0xff3F51F3),
          onPressed: () async {
            final res = await Navigator.of(context).pushNamed('/update');
            if (res == null) {
            } else if (res is int) {
              setState(() {
                widget.productManager.delete(res);
              });
            } else {
              final result = res as Map;
              setState(() {
                Product p = Product(
                  imageurl: 'assets/dress.jpg',
                  name: result['name'],
                  price: result['price'],
                  category: result['category'],
                  description: result['description'],
                );
                widget.productManager.addProduct(p: p);
              });
            }
          },
          child: const Icon(Icons.add, color: Color(0xffffffff), size: 36),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFCCCCCC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset('assets/shoe.jpg'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'July 14, 2023',
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontFamily: 'syne',
                                fontSize: 12,
                                color: Color(0xFFAAAAAA),
                              ),
                            ),
                          ),
                          const SizedBox(height: 3),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello, ',
                                  style: TextStyle(
                                    fontFamily: 'sora',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yohannes',
                                  style: TextStyle(
                                    fontFamily: 'Sora',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: const Color(0xffdddddd), width: 1),
                      ),
                      child: Stack(
                        children: [
                          const Icon(
                            Icons.notifications_outlined,
                            color: Colors.grey,
                            size: 24,
                          ),
                          Positioned(
                            top: 5,
                            right: 3,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
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
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Available products',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 24,
                    color: Color(0xff3e3e3e),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/search',
                        arguments: widget.productManager.products.values
                            .toList(),
                      );
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(color: const Color(0xffdddddd), width: 1),
                      ),
                      child: const Icon(Icons.search_rounded),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 19),
            
            Expanded(
              child: ProductListView(
                products: widget.productManager.products.values.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
