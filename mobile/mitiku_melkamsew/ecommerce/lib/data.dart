class Product {
  final String imageurl;
  final String name;
  final double price;
  final String category;
  final String description;

  Product({
    required this.imageurl,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });
}

class ProductManager {
  Map<int, Product> products = {
    0: Product(
      imageurl: 'assets/shoe.jpg',
      name: 'Derby leather\'s shoe',
      price: 120,
      category: 'Men\'s shoe',
      description:
          'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
    ),
    1: Product(
      imageurl: 'assets/robot.jpg',
      name: 'Awra Amba',
      price: 4999,
      category: 'robot',
      description:
          ' WALL-E - (Waste Allocation Load Lifter: Earth-Class) is a small, boxy robot designed for cleaning up Earth\'s abandoned waste-covered landscape in the distant future. Characterized by his rusted metal body, expressive binocular-like eyes, and tank-like treads, WALL-E embodies both industrial resilience and emotional charm. Despite his utilitarian design—built for compacting trash into neat cubes—WALL-E exhibits a surprising depth of personality, often showing curiosity, kindness, and a longing for connection. His weathered appearance and careful movements evoke a sense of loneliness and hope, making him a beloved symbol of environmental awareness and the enduring power of empathy. Whether navigating desolate ruins or marveling at a tiny plant, WALL-E captures the imagination with a perfect blend of mechanical functionality and heartfelt character.',
    ),
    2: Product(
      imageurl: 'assets/dress.jpg',
      name: 'Cotex',
      price: 795,
      category: 'Girl\'s dress',
      description:
          'A girl\'s dress is a charming and playful garment designed with both comfort and style in mind. Typically made from soft, breathable fabrics like cotton, chiffon, or linen, it may feature a variety of patterns—from floral prints to polka dots or pastel solids. The silhouette can range from a simple A-line to a more flared, twirl-ready skirt, often accented with delicate details like ruffles, bows, lace trims, or puffed sleeves. Whether sleeveless for warm summer days or long-sleeved for cooler weather, a girl\'s dress combines innocence and elegance, making it perfect for everything from casual outings to special occasions like birthdays or family gatherings. The design balances youthful energy with sweet sophistication, creating an effortlessly delightful look.',
    ),
    3: Product(
      imageurl: 'assets/sofa.jpg',
      name: 'Waryt\'Z',
      price: 999,
      category: 'Furniture',
      description:
          'A modern upholstered sofa is a stylish and functional centerpiece for any living space, designed to provide both comfort and sophistication. This sofa features a solid wood frame for long-lasting durability, paired with high-density foam cushions that offer excellent support and relaxation. Upholstered in soft, premium fabric with a smooth texture, it provides a cozy and inviting feel, ideal for everyday lounging or entertaining guests. The design includes wide armrests, a supportive backrest, and removable seat cushions for easy cleaning and maintenance. With its clean lines, neutral tones, and minimalist silhouette, this sofa complements a wide range of interior styles—from contemporary to classic. Whether placed in a living room, apartment, or office lounge, it brings a refined and comfortable touch to any environment.',
    ),
    4: Product(
      imageurl: 'assets/girls.jpg',
      name: 'Derby leather\'s shoe',
      price: 120,
      category: 'girl\'s shoe',
      description:
          'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
    ),
  };
  int id = 5;
  addProduct({required Product p}) {
    products[id] = p;
    id += 1;
  }

  viewAll() {}

  view() {}

  delete(id) {
    products.remove(id);
  }

  update() {}
}
