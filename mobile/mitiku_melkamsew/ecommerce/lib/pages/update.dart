import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    var font = TextStyle(
      color: Color(0xff3e3e3e),
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
    );
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
          child: Text('Add product', style: font.copyWith(fontSize: 16)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                    color: Color(0xfff3f3f3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xfff3f3f3), width: 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image, size: 36, color: Colors.grey[700]),
                      SizedBox(height: 10),
                      Text('upload image', style: font),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Form(),
            ],
          ),
        ),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _Form();
}

class _Form extends State<Form> {
  var font = TextStyle(
    color: Color(0xff3e3e3e),
    fontSize: 14,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
  );
  final TextEditingController _pdtNameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _pdtNameController.dispose();
    _categoryController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Name', style: font),
        TextField(
          controller: _pdtNameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfff3f3f3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text('Category', style: font),
        TextField(
          controller: _categoryController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfff3f3f3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('Price', style: font),
        TextField(
          controller: _priceController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfff3f3f3),
            suffixText: '\$',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 8),
        Text('Description', style: font),
        TextField(
          maxLines: 3,
          controller: _descriptionController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xfff3f3f3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            final name = _pdtNameController.text;
            final category = _categoryController.text;
            final price = double.tryParse(_priceController.text) ?? 0.0;
            final description = _descriptionController.text;
            Navigator.of(context).pop({
              'name': name,
              'category': category,
              'price': price,
              'description': description,
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff3F51F3),
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            "ADD",
            style: font.copyWith(
              fontWeight: FontWeight.w600,
              color: Color(0x80ffffff),
            ),
          ),
        ),
        SizedBox(height: 8),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Color(0xffff1313)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Delete',
            style: font.copyWith(
              fontWeight: FontWeight.w600,
              color: Color(0x80ff1313),
            ),
          ),
        ),
      ],
    );
  }
}
