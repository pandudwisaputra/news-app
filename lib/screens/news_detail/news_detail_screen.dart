import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../app.dart';
import '../../models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsModel data;

  const NewsDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title ?? '',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
            ),
            const SizedBox(
              height: 13,
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
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                data.urlToImage ??
                    'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://www.its.ac.id/tmesin/wp-content/uploads/sites/22/2022/07/no-image.png',
                    width: double.infinity,
                  );
                },
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Text(
                'Photo : ${data.source!.name}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
              ),
            ),
            const SizedBox(
              height: 9,
            ),
            Visibility(
              visible: data.publishedAt != null,
              child: Text(
                'Posted on : ${DateFormat('dd MMM,yyyy HH:mm').format(data.publishedAt!)}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0x1AED1B23),
                border: Border.all(
                  color: const Color(0x5ACA8585),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'By: ${data.author == null || data.author!.isEmpty ? '-' : data.author}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              data.description ?? '',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              data.content ?? '',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: 15,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
