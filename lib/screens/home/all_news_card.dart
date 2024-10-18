import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/screens/news_detail/news_detail_screen.dart';

class AllNewsCard extends StatelessWidget {
  final NewsModel data;

  const AllNewsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        openShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        openColor: Theme.of(context).scaffoldBackgroundColor,
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        transitionDuration: const Duration(milliseconds: 500),
        openBuilder: (context, action) => NewsDetailScreen(
          data: data,
        ),
        closedBuilder: (context, VoidCallback openContainer) => Material(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: openContainer,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xff555555),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          data.urlToImage ??
                              'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        right: 12,
                        bottom: 12,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              data.title ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                  ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 7,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0x801877F2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xff1877F2),
                              ),
                            ),
                            child: Text(
                              data.source!.name ?? '',
                              style: interWhiteTextStyle2.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
