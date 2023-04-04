class User{
  final int id;
  final String name;
  final int age;
  final String address;
  final String imageUrl;
  final bool isVerified;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    required this.imageUrl,
    this.isVerified = false,
  });

}