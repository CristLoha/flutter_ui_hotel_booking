class Schedule {
  Schedule({
    required this.image,
    required this.name,
    required this.date,
    required this.price,
  });

  final String image;
  final String name;
  final DateTime date;
  final double price;
}

final mySchedule = [
  Schedule(
    image: 'assets/images/1.png',
    name: 'The Aston Vill Hotel',
    date: DateTime(2025, 3, 19),
    price: 200.7,
  ),
  Schedule(
    image: 'assets/images/2.png',
    name: 'Golden Palace Hotel',
    date: DateTime(2025, 3, 25),
    price: 175.9,
  ),
];
