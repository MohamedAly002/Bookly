class ApiEndpoints {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String featuredBooks =
      'volumes?Filtering=free-ebooks&q=subject:general';
  static const String newestBooks =
      'volumes?Filtering=free-ebooks&q=a&Sorting=newest';
  static const String similarBooks =
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=';
  static const String searchBooks =
      'volumes?Filtering=free-ebooks&Sorting=relevance&q=';
}
