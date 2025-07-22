import 'dart:io';

class Product {
  String Name = "";
  String Description = "";
  double Price = 0;
  Product(this.Name, this.Description, this.Price) {}
}

class ProductManager {
  Map<String, Product> products = {};
  addProduct(String name, String description, double price) {
    products[name] = Product(name, description, price);
  }

  viewAll() {
    for (var entry in products.entries) {
      print(
        '\tName: ${entry.value.Name},\n\tDescription: ${entry.value.Description},\n\tPrice: ${entry.value.Price}\n',
      );
    }
  }

  view(String name) {
    Product? p = products[name];
    if (p != null) {
      print(
        'Name: ${p.Name},\nDescription: ${p.Description},\nPrice: ${p.Price}',
      );
    } else {
      print('Product not found.');
    }
  }

  update(
    String name, {
    String? newName,
    String? newDescription,
    double? newPrice,
  }) {
    Product? p = products[name];
    if (p != null) {
      if (newName != null) {
        products.remove(name);
        p.Name = newName;
        products[newName] = p;
      } else {
        if (newDescription != null) {
          p.Description = newDescription;
        }
        if (newPrice != null) {
          p.Price = newPrice;
        }
      }
    } else {
      print("Product not found.");
    }
  }

  delete(String name) {
    if (products[name] != null) {
      products.remove(name);
    } else {
      print("Product not found.");
    }
  }
}

quit() {
  String? quit = null;
  while (quit == null) {
    stdout.write('Enter any key to go back: ');
    quit = stdin.readLineSync();
  }
}

void main() {
  ProductManager manager = ProductManager();
  while (true) {
    print('\n--- Product Manager ---');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Update Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();
    switch (choice) {
      case '1':
        stdout.write('Enter product name: ');
        String? name = stdin.readLineSync();
        stdout.write('Enter product description: ');
        String? desc = stdin.readLineSync();
        stdout.write('Enter product price: ');
        String? priceStr = stdin.readLineSync();
        double? price = double.tryParse(priceStr ?? '');
        if (name != null && desc != null && price != null) {
          manager.addProduct(name, desc, price);
          print('Product added.');
          quit();
        } else {
          print('Invalid input.');
        }
        break;
      case '2':
        manager.viewAll();
        quit();
        break;
      case '3':
        stdout.write('Enter product name to view: ');
        String? name = stdin.readLineSync();
        if (name != null) {
          manager.view(name);
        } else {
          print('Invalid input.');
        }
        quit();
        break;
      case '4':
        stdout.write('Enter product name to update: ');
        String? name = stdin.readLineSync();
        if (name == null || name.isEmpty) {
          print('Invalid input.');
          break;
        }
        stdout.write('Enter new name (leave blank to keep unchanged): ');
        String? newName = stdin.readLineSync();
        stdout.write('Enter new description (leave blank to keep unchanged): ');
        String? newDesc = stdin.readLineSync();
        stdout.write('Enter new price (leave blank to keep unchanged): ');
        String? newPriceStr = stdin.readLineSync();
        double? newPrice = (newPriceStr != null && newPriceStr.isNotEmpty)
            ? double.tryParse(newPriceStr)
            : null;
        manager.update(
          name,
          newName: (newName != null && newName.isNotEmpty) ? newName : null,
          newDescription: (newDesc != null && newDesc.isNotEmpty)
              ? newDesc
              : null,
          newPrice: newPrice,
        );
        quit();
        break;
      case '5':
        stdout.write('Enter product name to delete: ');
        String? name = stdin.readLineSync();
        if (name != null) {
          manager.delete(name);
          print('Product deleted (if it existed).');
        } else {
          print('Invalid input.');
        }
        quit();
        break;
      case '6':
        print('Exiting...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
