import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../app.dart';
import '../../models/news_model.dart';
import '../news_detail/news_detail_screen.dart';

class HeadlinesNewsCard extends StatelessWidget {
  final NewsModel data;

  const HeadlinesNewsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
      ),
      child: OpenContainer(
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        openShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        openColor: Theme.of(context).scaffoldBackgroundColor,
        closedColor: Theme.of(context).scaffoldBackgroundColor,
        transitionDuration: const Duration(milliseconds: 500),
        openBuilder: (context, action) => NewsDetailScreen(
          data: data,
        ),
        closedBuilder: (context, VoidCallback openContainer) => GestureDetector(
          onTap: openContainer,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8 / 2,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8 / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        Color(0xe6000000),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 18,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          data.source!.name ?? '',
                          style: interWhiteTextStyle.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        data.title ?? '',
                        style: interWhiteTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 13,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${data.publishedAt == null ? "" : DateFormat('dd MMM yyyy HH:mm').format(data.publishedAt!)}${data.author == null || data.author!.isEmpty ? "" : ", by ${data.author}"}",
                        style: interGreyTextStyle.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
