
import 'items_model.dart';

class BooksModel {
  final int? totalItems;
  final List<ItemsModel> items;

  const BooksModel({
    this.totalItems,
    required this.items,
  });
}
