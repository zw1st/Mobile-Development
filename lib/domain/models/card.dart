class CardData {
  final String text;
  final String textDescription;
  final String? imageUrl;
  final String? id;

  CardData(
    this.text, {
    required this.textDescription,
    this.imageUrl,
    this.id
  });
}
