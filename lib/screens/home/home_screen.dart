import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/blocs/news/news_event.dart';
import 'package:news_app/widgets/shimmer_widget.dart';

import '../../blocs/news/news_bloc.dart';
import '../../blocs/news/news_state.dart';
import '../../repositories/news_repository.dart';
import 'all_news_card.dart';
import 'headlines_news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "News App",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    'assets/launcher_icon.png',
                    width: 30,
                  ),
                ],
              ),
              const HeadlinesSection(),
              const AllNewsSection(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  const AllNewsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(NewsRepository())..add(FetchEverythingNews()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RoundedShimmer(
                    height: 30,
                    width: 150,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RoundedShimmer(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RoundedShimmer(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RoundedShimmer(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RoundedShimmer(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: RoundedShimmer(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.width * 0.4,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          } else if (state is NewsLoaded) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "All",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w800,
                          fontSize: 24,
                        ),
                  ),
                  Column(
                    children: state.news
                        .map(
                          (value) => AllNewsCard(data: value),
                        )
                        .toList(),
                  )
                ],
              ),
            );
          } else if (state is NewsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class HeadlinesSection extends StatelessWidget {
  const HeadlinesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NewsBloc(NewsRepository())..add(FetchTopHeadlinesNews()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: RoundedShimmer(
                      height: 30,
                      width: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: RoundedShimmer(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.width * 0.8 / 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                            ),
                            child: RoundedShimmer(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height:
                                  MediaQuery.of(context).size.width * 0.8 / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NewsLoaded) {
            return Padding(
              padding: const EdgeInsets.only(
                top: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Headlines",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: state.news
                            .map(
                              (value) => HeadlinesNewsCard(data: value),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is NewsError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
