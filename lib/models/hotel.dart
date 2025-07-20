class Hotel {
  Hotel({
    required this.image,
    required this.name,
    required this.location,
    required this.price,
    required this.rate,
    required this.description,
    required this.preview,
    this.isFavorite = false,
  });

  final String image;
  final String name;
  final String location;
  final double price;
  final double rate;
  final String description;
  final List<String> preview;
  bool isFavorite;
}

final nearLocationHotel = [
  Hotel(
    image: 'assets/images/1.png',
    name: 'The Aston Vill Hotel',
    location: 'Alice Springs NT 0870, Australia',
    price: 200.7,
    rate: 5.0,
    isFavorite: true,
    description:
        'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming and delicious tasty oishi.',
    preview: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
  ),
  Hotel(
    image: 'assets/images/2.png',
    name: 'Golden Palace Hotel',
    location: 'Nothern Territory 0872, Australia',
    price: 175.9,
    rate: 5.0,
    isFavorite: true,
    description:
        'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming and delicious tasty oishi.',
    preview: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
  ),
];

final popularHotel = [
  Hotel(
    image: 'assets/images/3.png',
    name: 'Asteria Hotel',
    location: 'Wilora NT 0872, Australia',
    price: 165.3,
    rate: 5.0,
    description:
        'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming and delicious tasty oishi.',
    preview: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
  ),
  Hotel(
    image: 'assets/images/1.png',
    name: 'The Aston Vill Hotel',
    location: 'Alice Springs NT 0870, Australia',
    price: 200.7,
    rate: 5.0,
    description:
        'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming and delicious tasty oishi.',
    preview: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
  ),
  Hotel(
    image: 'assets/images/2.png',
    name: 'Golden Palace Hotel',
    location: 'Nothern Territory 0872, Australia',
    price: 175.9,
    rate: 5.0,
    description:
        'Aston Hotel, Alice Springs NT 0870, Australia is a modern hotel. elegant 5 star hotel overlooking the sea. perfect for a romantic, charming and delicious tasty oishi.',
    preview: [
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
    ],
  ),
];
