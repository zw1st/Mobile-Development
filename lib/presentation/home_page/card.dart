part of 'home_page.dart';

typedef OnLikeCallBack = void Function(String? id, String title, bool isLiked)?;

class _Card extends StatelessWidget {
  final String text;
  final String textDescription;
  final String? imageUrl;
  final OnLikeCallBack onLike;
  final VoidCallback? onTap;
  final bool isLiked;
  final String? id;

  const _Card(
    this.text, {
    required this.textDescription,
    this.imageUrl,
    this.onLike,
    this.onTap,
    this.id,
    this.isLiked = false,
  });

  factory _Card.fromData(CardData data, {OnLikeCallBack onLike, VoidCallback? onTap, bool isLiked = false}) => _Card(
        data.text,
        textDescription: data.textDescription,
        imageUrl: data.imageUrl,
        onLike: onLike,
        onTap: onTap,
        isLiked: isLiked,
        id: data.id,
      );


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        margin: const EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 4,
              offset: const Offset(0, 5),
              blurRadius: 8,
            )
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.orange.shade200,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 120,
                  child: Image.network(
                    imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        textDescription,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                      onTap: () => onLike?.call(id, text, isLiked),
                      child: AnimatedSwitcher(
                        duration: const Duration(microseconds: 1000),
                        child: isLiked
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                key: ValueKey<int>(0),
                              )
                            : const Icon(
                                Icons.favorite_border,
                                key: ValueKey<int>(1),
                              ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
