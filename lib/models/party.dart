class Party {
  final int number;
  final String id;
  final String titleKyrgyz;
  final String titleRussian;
  final String? image;
  final String count;

  Party({
    required this.number,
    required this.titleKyrgyz,
    required this.titleRussian,
    this.image,
    required this.count,
    required this.id,
  });
}
