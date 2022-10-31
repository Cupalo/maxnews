import 'package:flutter/material.dart';
import 'package:maxnews/models/news.dart';

import '../../default/theme.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    required this.title,
    required this.item,
  }) : super(key: key);
  final String title;
  final Articles item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: BaseTheme.marginAll,
        child: Stack(
          children: [
            item.urlToImage != null
                ? Image(
                    image: NetworkImage(
                      item.urlToImage!,
                    ),
                    fit: BoxFit.fill,
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      return Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey,
                        ),
                        child: child,
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return box(
                          Center(
                            child: BaseTheme.loading(),
                          ),
                        );
                      } else {
                        return child;
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return box(
                        const Image(
                          image: AssetImage('assets/logo.png'),
                        ),
                      );
                    },
                  )
                : box(
                    const Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: BaseTheme.marginRectangularSmall,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: Colors.black.withOpacity(0.8),
                ),
                child: Text(
                  item.title ?? '',
                  style: TextStyle(
                    fontSize: BaseTheme.fontSizeSmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container box(Widget child) {
    return Container(
      padding: BaseTheme.marginHorizontalLarge,
      height: 200,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black26,
      ),
      child: child,
    );
  }
}
