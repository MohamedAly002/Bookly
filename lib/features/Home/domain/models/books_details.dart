class BooksDetails {
  final List<String> authors;
  final String title;
  final String imageLink;
  final String previewLink;
  final num averageRating;
  final num ratingsCount;
  final List<String> categories;

  const BooksDetails({
    required this.authors,
    required this.title,
    required this.imageLink,
    required this.previewLink,
    required this.averageRating,
    required this.ratingsCount, required this.categories,
  });
}