import 'package:bookly_app_clean_arc/features/home/presentation/manager/home_cubits/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/bloc_consumer_horizontal_list.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/bloc_consumet_best_seller_list.dart';
import 'package:bookly_app_clean_arc/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:bookly_app_clean_arc/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() async {
    var currentPosition = scrollController.position.pixels;
    var maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.7 * maxPosition) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: const [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                SizedBox(
                  height: 12,
                ),
                BlocConsumerHorizontalList(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocConsumerBestSellerList(),
        ),
      ],
    );
  }
}
